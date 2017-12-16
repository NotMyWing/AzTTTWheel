-- Beep boop stuff.
include("cl_hud.lua")
include("arc.lua")

-- Actual code.

AzWheel.Wheel = {
    Radius = 256 + 32,
    Thickness = 128,
    TumblerSize = 32,
    BorderSize = 8,
    ReactionTreshold = 0.675,
    DrawingArcSteps = 16,
    SegmentThickness = 64,
    Segments = {}
}

local function defaultChatterDisabled()
    return CurTime() - (AzWheel.LastChatter or 0) < 3;
end

--[[
    HELP
]]--
table.insert(AzWheel.Wheel.Segments, {
    Icon = nil,
    Name = "tttwheel.seg.help",
    Description = "tttwheel.seg.help.desc",
    Call = function()
        local sounds = {
            "vo\\npc\\male01\\help01.wav"
        }
        local rnd = table.Random(sounds);
        AzWheel:PlaySound(rnd, 100);
        RunConsoleCommand("ttt_radio", "help");
    end,
    Disabled = defaultChatterDisabled
});

--[[
    DISAGREE
]]--

table.insert(AzWheel.Wheel.Segments, {
    Icon = nil,
    Name = "tttwheel.seg.disagree",
    Description = "tttwheel.seg.disagree.desc",
    Call = function()
        local sounds = {
            "vo\\npc\\male01\\no01.wav",
            "vo\\npc\\male01\\ohno.wav",
        }
        local rnd = table.Random(sounds);
        AzWheel:PlaySound(rnd);
        RunConsoleCommand("ttt_radio", "no");
    end,
    Disabled = defaultChatterDisabled
});

--[[
    EXCUSE
]]--
table.insert(AzWheel.Wheel.Segments, {
    Icon = nil,
    Name = "tttwheel.seg.excuse",
    Description = "tttwheel.seg.excuse.desc",
    Call = function()
        local sounds = {
            "vo\\npc\\male01\\excuseme01.wav",
            "vo\\npc\\male01\\excuseme02.wav",
            "vo\\npc\\male01\\pardonme01.wav",
            "vo\\npc\\male01\\pardonme02.wav"
        }
        local rnd = table.Random(sounds);
        AzWheel:PlaySound(rnd);
    end,
    Disabled = defaultChatterDisabled
});

--[[
    AGREE
]]--
table.insert(AzWheel.Wheel.Segments, {
    Icon = nil,
    Name = "tttwheel.seg.agree",
    Description = "tttwheel.seg.agree.desc",
    Call = function()
        local sounds = {
            "vo\\npc\\male01\\ok01.wav",
            "vo\\npc\\male01\\ok02.wav",
            "vo\\npc\\male01\\yeah02.wav",
        }
        local rnd = table.Random(sounds);
        AzWheel:PlaySound(rnd);
        RunConsoleCommand("ttt_radio", "yes");
    end,
    Disabled = defaultChatterDisabled
});

--[[
    RUN
]]--
table.insert(AzWheel.Wheel.Segments, {
    Icon = nil,
    Name = "tttwheel.seg.run",
    Description = "tttwheel.seg.run.desc",
    Call = function()
        local sounds = {
            "vo\\npc\\male01\\takecover02.wav",
            "vo\\npc\\male01\\strider_run.wav",
            "vo\\npc\\male01\\runforyourlife01.wav",
            "vo\\npc\\male01\\gethellout.wav"
        }
        local rnd = table.Random(sounds);
        AzWheel:PlaySound(rnd, 100);
    end,
    Disabled = defaultChatterDisabled
});

--[[
    GREETINGS
]]--
table.insert(AzWheel.Wheel.Segments, {
    Icon = nil,
    Name = "tttwheel.seg.greet",
    Description = "tttwheel.seg.greet.desc",
    Call = function()
        local sounds = {
            "vo\\npc\\male01\\hi01.wav",
            "vo\\npc\\male01\\hi02.wav",          
        }
        local rnd = table.Random(sounds);
        AzWheel:PlaySound(rnd);
    end,
    Disabled = defaultChatterDisabled
});

--[[
    DROP WEAPON
]]--
table.insert(AzWheel.Wheel.Segments, {
    Icon = nil,
    Name = "tttwheel.seg.empty",
    Description = "",
    Call = function()

    end
});

table.insert(AzWheel.Wheel.Segments, {
    Icon = nil,
    Name = "tttwheel.seg.chatter",
    Description = "tttwheel.seg.chatter.desc",
    Call = function()
        local sounds = {
            "vo\\npc\\male01\\answer38.wav",
            "vo\\npc\\male01\\busy02.wav",
            "vo\\npc\\male01\\fantastic01.wav",
            "vo\\npc\\male01\\fantastic02.wav",
            "vo\\npc\\male01\\goodgod.wav",
            "vo\\npc\\male01\\moan01.wav",
            "vo\\npc\\male01\\nice.wav",
            "vo\\npc\\male01\\notthemanithought01.wav",
            "vo\\npc\\male01\\notthemanithought02.wav",
            "vo\\npc\\male01\\oneforme.wav",
            "vo\\npc\\male01\\question01.wav",
            "vo\\npc\\male01\\question02.wav",
            "vo\\npc\\male01\\question03.wav",
            "vo\\npc\\male01\\question04.wav",
            "vo\\npc\\male01\\question05.wav",
            "vo\\npc\\male01\\question06.wav",
            "vo\\npc\\male01\\question07.wav",
            "vo\\npc\\male01\\question08.wav",
            "vo\\npc\\male01\\question09.wav",
            "vo\\npc\\male01\\question10.wav",
            "vo\\npc\\male01\\question11.wav",
            "vo\\npc\\male01\\question12.wav",
            "vo\\npc\\male01\\question13.wav",
            "vo\\npc\\male01\\question14.wav",
            "vo\\npc\\male01\\question15.wav",
            "vo\\npc\\male01\\question16.wav",
            "vo\\npc\\male01\\question17.wav",
            "vo\\npc\\male01\\question18.wav",
            "vo\\npc\\male01\\question19.wav",
            "vo\\npc\\male01\\question21.wav",
            "vo\\npc\\male01\\question22.wav",
            "vo\\npc\\male01\\question23.wav",
            "vo\\npc\\male01\\question24.wav",
            "vo\\npc\\male01\\question25.wav",
            "vo\\npc\\male01\\question26.wav",
            "vo\\npc\\male01\\question27.wav",
            "vo\\npc\\male01\\question28.wav",
            "vo\\npc\\male01\\question29.wav",
            "vo\\npc\\male01\\question30.wav",
            "vo\\npc\\male01\\question31.wav",
            "vo\\npc\\male01\\vanswer01.wav",
            "vo\\npc\\male01\\vanswer02.wav",
            "vo\\npc\\male01\\vanswer03.wav",
            "vo\\npc\\male01\\vanswer04.wav",
            "vo\\npc\\male01\\vanswer05.wav",
            "vo\\npc\\male01\\vanswer06.wav",
            "vo\\npc\\male01\\vanswer07.wav",
            "vo\\npc\\male01\\vanswer08.wav",
            "vo\\npc\\male01\\vanswer09.wav",
            "vo\\npc\\male01\\vanswer10.wav",
            "vo\\npc\\male01\\vanswer11.wav",
            "vo\\npc\\male01\\vanswer12.wav",
            "vo\\npc\\male01\\vanswer13.wav",
            "vo\\npc\\male01\\vanswer14.wav",
            "vo\\npc\\male01\\vquestion01.wav",
            "vo\\npc\\male01\\vquestion02.wav",
            "vo\\npc\\male01\\vquestion03.wav",
            "vo\\npc\\male01\\vquestion04.wav",
            "vo\\npc\\male01\\vquestion05.wav",
            "vo\\npc\\male01\\vquestion06.wav",
            "vo\\npc\\male01\\vquestion07.wav"
        }
        local rnd = table.Random(sounds);
        AzWheel:PlaySound(rnd);
    end,
    Disabled = defaultChatterDisabled
});

AzWheel.Mouse = {}

function AzWheel:PlaySound(snd, lvl)
    self.LastChatter = CurTime();
    net.Start("AzWheel PlaySound");
        net.WriteString(snd);
        net.WriteInt(lvl || 75, 8);
    net.SendToServer();
end

function AzWheel:IsVisible()
    return self.Visible
end

function AzWheel.Show()
    local self = AzWheel;
    self.Mouse.RawXY = Vector(0, 0);

    self.Visible = true;
    self.TimeOpened = CurTime();

    -- Stop propagation
    return false;
end

local ang_distance = function(x, y)
    return (x - y + 180) % 360 - 180;
end

function AzWheel:IsSegmentDisabled(seg)
    if (seg.Disabled == null) then
        return false;
    elseif (type(seg.Disabled) == "boolean") then
        return seg.Disabled;
    elseif (type(seg.Disabled) == "function") then
        return seg.Disabled()
    else
        return false;
    end
end

function AzWheel.Hide(self, noexec)
    local self = AzWheel;
    
    if (!self.Visible) then return end;

    self.Visible = false;
    self.TimeClosed = CurTime();

    if (noexec) then return end;

    -- Determine which segment cursor was above. 
    local full_segsize = 360 / table.Count(self.Wheel.Segments);
    local segsize = full_segsize * 0.9;
    local spacing = (full_segsize - segsize) / 2;
    local ang = -full_segsize / 2;

    for k, v in pairs(self.Wheel.Segments) do
        -- Is it selected?
        local trigger_center = ang + full_segsize / 2
        local selected = self.Mouse.Polar.Distance > self.Wheel.ReactionTreshold * self.Wheel.Radius && math.abs(ang_distance(math.deg(self.Mouse.Polar.Angle), trigger_center)) < segsize / 2;  
        ang = ang + full_segsize;

        if (selected && !self:IsSegmentDisabled(v)) then
            v.Call();
        end
    end

    -- Stop propagation
    return false;
end

function AzWheel.Init()
    local self = AzWheel;

    self.Initialized = true;
end

hook.Add("Initialize", "TTT Wheel Init", AzWheel.Init);
-- Handle script reloads
if (AzWheel.Initialized) then
    AzWheel.Init();
end

local sensitivity = GetConVar("sensitivity");
function AzWheel.InputMouseApply(cmd, x, y, ang)
    local self = AzWheel;

    if (self:IsVisible()) then
        cmd:SetMouseX(0);
        cmd:SetMouseY(0);
    
        local spd = 1.45;
        x = x / sensitivity:GetInt() * spd;
        y = y / sensitivity:GetInt() * spd;

        local raw = self.Mouse.RawXY + Vector(x, y);

        local polar = {};
        polar.Distance = raw:Length();
        polar.Angle = math.atan2(raw.y, raw.x);
        if (polar.Distance > self.Wheel.Radius - self.Wheel.TumblerSize - self.Wheel.SegmentThickness / 4) then
            polar.Distance = self.Wheel.Radius - self.Wheel.TumblerSize - self.Wheel.SegmentThickness / 4;
            raw.x = math.cos(polar.Angle) * polar.Distance;
            raw.y = math.sin(polar.Angle) * polar.Distance;
        end

        self.Mouse.Polar = polar;
        self.Mouse.RawXY = raw;
        return true;
    end
end

function AzWheel.CreateMove(cmd)
    local self = AzWheel;

    if (cmd:GetButtons() % 2 == 1) then
        if (self:IsVisible()) then
            cmd:SetButtons(cmd:GetButtons() - 1);
            self:Hide();    
            return true;
        -- Extraordinary hacks? •c•
        elseif (CurTime() - (self.TimeClosed or 0) < 0.25) then
            cmd:SetButtons(cmd:GetButtons() - 1);
            RunConsoleCommand("-attack");
            return true;
        end
    end

    if (cmd:KeyDown(IN_ATTACK2)) then
        if (self:IsVisible()) then
            cmd:SetButtons(cmd:GetButtons() - 2048);

            RunConsoleCommand("ttt_dropweapon")
            WSWITCH:Disable()

            self:Hide(true);    
            return true;
        -- Extraordinary hacks? •c•
        elseif (CurTime() - (self.TimeClosed or 0) < 0.25) then
            cmd:SetButtons(cmd:GetButtons() - 2048);
            RunConsoleCommand("-attack2");
            return true;
        end
    end
    
end

hook.Add("OnSpawnMenuOpen", "TTT Wheel Show", AzWheel.Show);
hook.Add("OnSpawnMenuClose", "TTT Wheel Hide", AzWheel.Hide);
hook.Add("InputMouseApply", "TTT Wheel MouseInput", AzWheel.InputMouseApply);
hook.Add("CreateMove", "TTT Wheel MouseClicker", AzWheel.CreateMove);