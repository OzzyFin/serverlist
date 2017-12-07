--	// Checks if server is valid
  --  // -> if not, prompt the player with the serverlist and let them queue for a server
  --  // -> if yes, create a new server entry
--  // Moves everything into their corresponding directories

local baseFolder = script.Parent.Parent.Parent
local stdLibrary = baseFolder.libraries.SERVERLIST_STD
stdLibrary.Parent = game:GetService("ReplicatedStorage")	--	// The only library that needs to be accessed as soon as possible
local std = require(stdLibrary)

local config = require(baseFolder.configuration)
local DS = require(baseFolder.libraries.datastores)

local maximumServersReached = Instance.new("BoolValue") do
	local serverData = table.clone(config.EMPTY_SERVER_DATA)
	local serverList = DS.serverData:GetAsync("serverList")
	if not serverList then
		serverList = {serverData}
  	DS.serverData:SetAsync("serverList",serverList)
	else
		maximumServersReached.Value = #serverList >= config.MAX_SERVER_COUNT
		maximumServersReached.Name = "maximumServersReached"
		maximumServersReached.Parent = baseFolder

		if maximumServersReached.Value == false then
			DS.serverData:UpdateAsync("serverList",function(serverList)
				--	// Recheck the server amounts in case overlapping due to data stores being slow
				if #serverList < config.MAX_SERVER_COUNT then
					table.insert(serverList,serverData)
				else
					maximumServersReached.Value = true
				end
				return serverList
			end)
		end
	end
end

--  //

local function createRemote(className,name)
  Instance.new(className,baseFolder.remotes).Name = name
end

--  //

local serverScripts = baseFolder.src.server
local clientScripts = baseFolder.src.client

serverScripts.Name = "SERVERLIST_SERVER"
clientScripts.Name = "SERVERLIST_CLIENT"

serverScripts.Parent = std.Services.ServerScriptService
clientScripts.Parent = std.Services.StarterPlayer.StarterPlayerScripts


--  // Create all the necessary remotes

createRemote("RemoteEvent","dataUpdateEvent")

--  //

baseFolder.Parent = std.Services.ReplicatedStorage
Instance.new("BoolValue",baseFolder).Name = "SETUP_COMPLETE"
