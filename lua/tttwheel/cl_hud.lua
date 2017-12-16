local function scale(x, base)
	base = base or 1080
	return math.ceil(ScrH() * (x / base))
end

surface.CreateFont("TTT Wheel Names", {
	font	    = "Helvetica",
	size	    = scale(24),
    weight	    = 800,
    extended    = true,
    antialias   = true
} )

surface.CreateFont("TTT Wheel Descriptions", {
	font	    = "Helvetica",
	size	    = scale(16),
    weight	    = 800,
    extended    = true,
    antialias   = true
} )

local cached = false
local picker = Material("materials/ttt_wheel_picker_a.png");
local mouse = Material("materials/mouse.png");

local ang_distance = function(x, y)
    return (x - y + 180) % 360 - 180;
end

local ang_norm = function(a)
    return a % 360 - 180;
end 

function AzWheel:Cache()
    local clr = Color(255 / 2, 128 / 2, 0, 96);

    local angle = 0;
    local radius = scale(self.Wheel.Radius);
    local thickness = scale(self.Wheel.Thickness);
    local border = scale(self.Wheel.BorderSize);
    local arc_steps = self.Wheel.DrawingArcSteps;
    local arc_step = thickness * 0.5 / arc_steps;

    local clk = os.clock()

    for k, v in pairs(self.Wheel.Segments) do
       v.Cache = nil 
    end
    self.Wheel.Cache = {}
    self.Wheel.Cache.Arcs = {}
    print("Starting caching wheel...");
    for I = 1, arc_steps do
        local arc = {};
        arc.Radius = I * arc_step + radius - thickness * 0.5;
        
        local color = clr;
        color = Color(color.r, color.g, color.b, color.a);
        color.a = color.a * I / arc_steps;

        local arc = exdraw.PrecacheArc(ScrW() / 2, ScrH() / 2, arc.Radius, arc_step, 0, 360, 12)
        table.insert(self.Wheel.Cache.Arcs, arc);
        arc.Color = color
    end
    local arc = exdraw.PrecacheArc(ScrW() / 2, ScrH() / 2, radius, border, 0, 360, 2)
    table.insert(self.Wheel.Cache.Arcs, arc);
    arc.Color = clr;

    print(string.format("Caching done! Took %.3f seconds.", os.clock() - clk));
end

local function drawTextShadow(tbl, ofx, ofy)
    local pos = tbl.pos;
    local c = tbl.color;

    tbl.pos = Vector(ofx or 2, ofy or ofx or 2) + tbl.pos;
    tbl.color = Color(0, 0, 0);

    draw.Text(tbl);

    tbl.pos = pos;
    tbl.color = c;

    draw.Text(tbl);
end

function AzWheel.Draw()
    if (!cached) then
        cached = true
        AzWheel:Cache()
    end

    local self = AzWheel;
    if (!self:IsVisible()) then return end;

    local cx = ScrW() / 2;
    local cy = ScrH() / 2;

    cam.Start2D()
        local speed = 0.125
        local time = math.min(speed, CurTime() - (self.TimeOpened or 0));
        surface.SetAlphaMultiplier(time * 8)  

        local full_segsize = 360 / table.Count(self.Wheel.Segments);
        local segsize = full_segsize * 0.9;
        local spacing = (full_segsize - segsize) / 2;
        local ang = -full_segsize / 2; 
        local clr = Color(255, 160, 64, 160);
        local radius = scale(self.Wheel.Radius);
        local thickness = scale(self.Wheel.SegmentThickness);
        local border = scale(self.Wheel.BorderSize);

        for k, v in pairs(self.Wheel.Segments) do
            -- Is it selected?
            local trigger_center = ang + full_segsize / 2
            local selected = self.Mouse.Polar.Distance > self.Wheel.ReactionTreshold * self.Wheel.Radius && math.abs(ang_distance(math.deg(self.Mouse.Polar.Angle), trigger_center)) < segsize / 2;  
            local disabled = self:IsSegmentDisabled(v);
            local clr = Color(clr.r, clr.g, clr.b, clr.a)
            if (disabled) then
                clr.r = clr.r * 0.25;
                clr.g = clr.g * 0.25;
                clr.b = clr.b * 0.25;
                clr.a = clr.a * 1.5;
            elseif (!selected) then
                clr.r = clr.r * 0.5;
                clr.g = clr.g * 0.5;
                clr.b = clr.b * 0.5;
                clr.a = clr.a * 1.25;
            end
            exdraw.Arc(ScrW() / 2, ScrH() / 2, radius - border * 2, thickness, 360 - ang - full_segsize + spacing, 360 - ang - spacing, 4, clr)

            v.Cache = v.Cache or {}
            -- Precache center
            if (!v.Cache.Center) then
                local r = radius - thickness * 0.75;
                local x = math.cos(math.rad(trigger_center)) * r;
                local y = math.sin(math.rad(trigger_center)) * r;
                v.Cache.Center = Vector(x, y);
            end
            
            -- Accumulate space for description 
            local acc = az_translatable(v.Description) && -10 || 0;

            -- And draw description
            drawTextShadow({
                font = "TTT Wheel Names",
                text = az_translate(v.Name),
                xalign = TEXT_ALIGN_CENTER,
                yalign = TEXT_ALIGN_CENTER,
                pos = Vector(ScrW() / 2, ScrH() / 2) + v.Cache.Center + Vector(0, acc),
            })

            acc = acc + 10;
            drawTextShadow({
                font = "TTT Wheel Descriptions",
                text = az_translatable(v.Description) && az_translate(v.Description) or "",
                xalign = TEXT_ALIGN_CENTER,
                yalign = TEXT_ALIGN_TOP,
                pos = Vector(ScrW() / 2, ScrH() / 2) + v.Cache.Center + Vector(0, acc),
            })

            surface.SetDrawColor(selected && Color(255, 32, 32) || Color(255, 255, 255))

            ang = ang + full_segsize;
        end

        -- Draw tumbler
        surface.SetMaterial(picker);
        surface.SetDrawColor(Color(255, 255, 255))
        local w = scale(self.Wheel.TumblerSize);
        surface.DrawTexturedRect( ScrW() / 2 + self.Mouse.RawXY.x - w / 2, ScrH() / 2 + self.Mouse.RawXY.y- w / 2, w, w ) 
        
        surface.SetAlphaMultiplier( 1 ) 

        -- Draw rightclick
        local deg = math.rad(45);
        local w = scale(32);
        local pos = Vector(math.cos(deg), math.sin(deg)) * self.Wheel.Radius * 1.1;

        surface.SetMaterial(mouse);
        surface.SetDrawColor(Color(255, 255, 255))
        surface.DrawTexturedRect( ScrW() / 2 + pos.x - w / 2, ScrH() / 2 + pos.y - w / 2, w, w ) 

        drawTextShadow({
            font = "TTT Wheel Names",
            text = az_translate("tttwheel.dropwp"),
            xalign = TEXT_ALIGN_LEFT,
            yalign = TEXT_ALIGN_CENTER,
            pos = Vector(ScrW() / 2 + pos.x + w / 2, ScrH() / 2 + pos.y),
        })
    cam.End2D()
end

hook.Add("PostDrawHUD", "TTT Wheel Draw", AzWheel.Draw);
