-- Beep boop stuff.
AddCSLuaFile("cl_hud.lua")
AddCSLuaFile("arc.lua")

util.AddNetworkString("AzWheel PlaySound");

resource.AddFile("materials/ttt_wheel_picker_a.png");
resource.AddFile("materials/mouse.png");

net.Receive("AzWheel PlaySound", function(len, ply)
    local snd = net.ReadString();
    local lvl = net.ReadInt(8);

    if (IsValid(ply) && ply:Alive() && ply:GetObserverMode() == 0) then
        ply:EmitSound( snd, lvl, 100, 1 )
    end
end)