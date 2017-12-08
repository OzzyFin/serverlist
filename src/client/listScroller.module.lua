--	//
local std = require(game:GetService("ReplicatedStorage"):WaitForChild("SERVERLIST_STD"))
--	// No need to wait for setup complete as the scripts requiring modules should already do it

--	//

local function toggleServerButtonChildren(serverButton)
	for _,child in next,serverButton:GetChildren() do
		if child:IsA("GuiObject") then
			child.Visible = not child.Visible
		end
	end
end

local function connectServerFrameEvents(scroller,frame)
	frame.joinButton.MouseButton1Click:Connect(function()
		if scroller.enabled and frame.serverId.Value then
			std.Services:TeleportToPlaceInstanceAsync(game.PlaceId,frame.serverId.Value)
		end
	end)
	frame.serverButton.MouseButton1Click:Connect(function()
		if scroller.enabled then
			local size = UDim2.new(frame.Size.X.Scale,frame.Size.X.Offset,0,0)
			if frame.isExpanded.Value == false then
				size = size + UDim2.new(
					0,
					0,
					frame.Size.Y.Scale*std.config.SERVER_FRAME_EXPAND_MULTIPLIER,
					frame.Size.Y.Offset*std.config.SERVER_FRAME_EXPAND_MULTIPLIER
				)

			else
				size = size + UDim2.new(
					0,
					0,
					frame.Size.X.Scale/std.config.SERVER_FRAME_EXPAND_MULTIPLIER,
					frame.Size.X.Offset/std.config.SERVER_FRAME_EXPAND_MULTIPLIER
				)
			end
			frame.Size = size
			frame.isExpanded.Value = not frame.isExpanded.Value
			toggleServerButtonChildren()
		end
	end)
end

--	//

local listScroller = {}

listScroller.new = function(frameProperties)
	local new = setmetatable({},{__index = listScroller})

	new.enabled = true

	new.frame = std.Assets.listScroller:Clone()
	new.frame.Visible = true
	for property,value in next,frameProperties do
		new.frame[property] = value
	end

	return new
end

function listScroller:writeServerFrame(frame,data)
	frame.serverId.Value = data.serverId
	frame.serverNum.Value = data.serverNum
	frame.averagePingLabel.Text = data.averagePing
	frame.serverButton.playerCountLabel.Text = data.playerCount
	frame.serverButton.serverNumLabel.Text = data.serverNum
end

function listScroller:addServerFrame(data)
	local newFrame = std.Assets.serverFrame:Clone()
	newFrame.Visible = true
	self:writeServerFrame(newFrame,data)
	newFrame.Parent = self.frame
end

function listScroller:findServerFrameByServerId(serverId)
	for _,child in next,self.frame:GetChildren() do
		if child:FindFirstChild("serverId") then
			if child.serverId.Value == serverId then
				return child
			end
		end
	end
end

return listScroller
