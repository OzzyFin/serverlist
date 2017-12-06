--  // Updates the data stores with information from the server

local std = require(game:GetService("ReplicatedStorage"):WaitForChild("SERVERLIST_STD"))
std:waitForSetupComplete()

local table = std.Libraries.table
local DS = std.Libraries.datastores

--  //
