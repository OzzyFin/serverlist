local DSS = game:GetService("DataStoreService")

local storages = {

	serverData = DSS:GetDataStore("SERVERLIST_DATASTORE_DEVTEST1")
	--  //
	--  //  serverList = {
	--  //    [1] = {serverData}
	--  //  }
	--  //
}

return storages
