local std = {}

std.Services = setmetatable({},{__index = function(self,name)
	local service = game:GetService(name)
	self[name] = service	--	// add to the cache so GetService doesn't have to be called each time
	return service
end})

std.Modules = setmetatable({},{__index = function(self,name)
	local module = require(std.baseFolder.modules[name])	--	// It is supposed to error for incorrect names
	self[name] = module
	return module
end})

std.Remotes = setmetatable({},{__index = function(self,name)
	local remote = std.baseFolder.remotes:FindFirstChild(name)
	self[name] = remote
	return remote
end})

std.Assets = setmetatable({},{__index = function(self,name)
	local asset = std.baseFolder.assets:FindFirstChild(name)
	self[name] = asset
	return asset
end})

function std:waitForSetupComplete()
	self.baseFolder = self.Services.ReplicatedStorage:WaitForChild("SERVERLIST")
	self.baseFolder:WaitForChild("SETUP_COMPLETE")
	self.config = self.baseFolder:WaitForChild("configuration")
end

return std
