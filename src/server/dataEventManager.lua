--  // Sends the clients information about data updates

local std = require(game:GetService("ReplicatedStorage"):WaitForChild("SERVERLIST_STD"))
std:waitForSetupComplete()

local table = std.Libraries.table
local DS = std.Libraries.datastores

--  //
