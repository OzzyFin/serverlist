--	// Controls the server list GUI and visualizes the data gotten from server
local std = require(game:GetService("ReplicatedStorage"):WaitForChild("SERVERLIST_STD"))

local localPlayer = std.Services.Players.LocalPlayer

--	//

local listScroller = require(script.Parent.listScroller)

local module = {}

function module:Init()
	local GUI = std.Assets.SERVERLIST:Clone()

	local scroller = listScroller.new({
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1,1),
		Position = UDim2.new(1,0,1,0),
		Size = UDim2.new(0.2,0,0.3,0)
	})

	scroller.frame.Parent = GUI
	GUI.Parent = localPlayer:WaitForChild("PlayerGui")

	std.Remotes.serverListUpdateEvent.OnClientEvent:Connect(function(serverList)
		for serverNum,serverData in next,serverList do
			serverData.serverNum = serverNum
			local frame = scroller:findServerFrameByServerId(serverData.serverId)
			if frame then
				scroller:writeServerFrame(frame,serverData)
			else
				scroller:addServerFrame(serverData)
			end
		end
	end)

	--	// Ask for the data for the first time
	std.Remotes.serverListUpdateEvent:FireServer()
end

return module
