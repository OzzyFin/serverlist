--	//
local std = require(game:GetService("ReplicatedStorage"):WaitForChild("SERVERLIST_STD"))
--	// No need to wait for setup complete as the scripts requiring modules should already do it

--	//

local listScroller = {}

listScroller.new = function(frameProperties)
	local new = setmetatable({},{__index = listScroller})

	new.frame = std.Assets.listScroller:Clone()
	for property,value in next,frameProperties do
		new.frame[property] = value
	end

	return new
end

return listScroller
