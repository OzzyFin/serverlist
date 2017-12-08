--  // Sends the clients information about data updates

local std = require(game:GetService("ReplicatedStorage"):WaitForChild("SERVERLIST_STD"))
std:waitForSetupComplete()

local table = std.Libraries.table
local DS = std.Libraries.datastores

--  //

local serverListCache = DS.serverData:GetAsync("serverList")

--	//

local function passServerList(player)
	while serverListCache == nil do wait() end
	for _,s in next,serverListCache do
		for k,v in next,s do
			print(k,v)
		end
	end
	std.Remotes.serverListUpdateEvent:FireClient(player,serverListCache)
end

--	//

do
	local cooldownArray = {}
	std.Remotes.serverListUpdateEvent.OnServerEvent:Connect(function(player)
		local t = tick()
		if cooldownArray[player] == nil or t - cooldownArray[player] >= .5 then
			cooldownArray[player] = t
			passServerList(player)
		end
	end)
end

--	// Update cache

DS.serverData:OnUpdate("serverList",function(serverList)
	serverListCache = serverList
end)

--	// Update the players with the data

while true do
	for _,player in next,std.Services.Players:GetPlayers() do
		passServerList(player)
	end
	wait(std.config.SERVER_LIST_REFRESH_INTERVAL)
end
