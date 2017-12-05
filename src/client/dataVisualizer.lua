--	// Visualizes the data gotten from the server

local std = require(game:GetService("ReplicatedStorage"):WaitForChild("SERVERLIST_STD"))
std:waitForSetupComplete()

local table = std.Modules.table
local localPlayer = std.Services.Players.LocalPlayer

--  //
