--	// Checks if server is valid
  --  // -> if not, prompt the player with the serverlist and let them queue for a server
  --  // -> if yes, create a new server entry
--  // Moves everything into their corresponding directories

local baseFolder = script.Parent.Parent.Parent
local stdModule = baseFolder.modules.SERVERLIST_STD
stdModule.Parent = game:GetService("ReplicatedStorage")	--	// The only library that needs to be accessed as soon as possible
local std = require(stdModule)

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
