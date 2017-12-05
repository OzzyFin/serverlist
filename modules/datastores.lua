local DSS = game:GetService("DataStoreService")

local storages = {
  serverList = DSS:GetDataStore("SERVERLIST_DATASTORE_DEVTEST1")
}

return storages
