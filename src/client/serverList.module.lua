--	// Controls the server list GUI and visualizes the data gotten from server
local std = require(game:GetService("ReplicatedStorage"):WaitForChild("SERVERLIST_STD"))

local localPlayer = std.Services.Players.LocalPlayer

--	//

local listScroller = require(script.Parent.listScroller)

local module = {}

function module:Init()
	local GUI = std.Assets.SERVERLIST:Clone()
	GUI.Parent = localPlayer.PlayerGui
end

return module
