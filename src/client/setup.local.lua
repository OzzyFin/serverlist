--	// Sets the client up

local std = require(game:GetService("ReplicatedStorage"):WaitForChild("SERVERLIST_STD"))
std:waitForSetupComplete()

local localPlayer = std.Services.Players.LocalPlayer

--	//

local maximumServersReached = std.baseFolder.maximumServersReached.Value

local GUIModule = require(maximumServersReached and script.Parent.serverSelect or script.Parent.serverList)
GUIModule:Init()
