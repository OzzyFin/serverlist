--	// Sets the client up

local std = require(game:GetService("ReplicatedStorage"):WaitForChild("SERVERLIST_STD"))
std:waitForSetupComplete()

local localPlayer = std.Services.Players.LocalPlayer

--	//

std.Assets.SERVERLIST:Clone().Parent = localPlayer.PlayerGui
