local DSS = game:GetService("DataStoreService")

local storages = {

	serverData = DSS:GetDataStore("SERVERLIST_DATASTORE_DEVTEST6")
	--  //
	--  //  serverList = {
	--  //    [1] = {serverData}
	--  //  }
	--  //
}

return storages
