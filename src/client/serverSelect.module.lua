--	// Controls the server selector GUI if the maximum server amount is reached
local std = require(game:GetService("ReplicatedStorage"):WaitForChild("SERVERLIST_STD"))

local localPlayer = std.Services.Players.LocalPlayer

--	//

local listScroller = require(script.Parent.listScroller)

local module = {}

function module:Init()
	if std.config.SERVER_SELECT_DISABLE_COREGUIS == true then
		std.Services.StarterGui:SetCore("TopbarEnabled",false)
	end

	local GUI = std.Assets.SERVERSELECT:Clone()
	GUI.Parent = localPlayer.PlayerGui
	local scroller = listScroller.new({
		BackgroundTransparency = 0.5,
		Size = UDim2.new(0.5,0,0.7,0),
		AnchorPoint = Vector2.new(0.5,0.5),
		Position = UDim2.new(0.5,0,0.5,0.5)
	})
	scroller.Parent = GUI
end

return module
