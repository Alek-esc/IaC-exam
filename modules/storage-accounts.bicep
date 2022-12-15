param kind string
param accessTier string
param location string default = resourceGroup().location
param storageAccountNames string[]

module storage-accounts {
  for (i in 0..storageAccountNames.length) {
    storageAccount storageAccountNames[i] {
      kind = kind
      accessTier = accessTier
      location = location
    }
  }
}
