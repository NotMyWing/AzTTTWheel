hook.Add("Initialize", "TTT Wheel i12n", function()
    if (GAMEMODE.Name != "Trouble in Terrorist Town") then return end;

    include("tttwheel/sh_init.lua")
    if (SERVER) then
        AddCSLuaFile();
        AddCSLuaFile("tttwheel/cl_init.lua");
        AddCSLuaFile("tttwheel/sh_init.lua");

        include("tttwheel/sv_init.lua");
    else
        include("tttwheel/cl_init.lua");
    end
end);

initialization