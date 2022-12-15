param deployApp bool
param storageAccountNames string[]

module 'storage-accounts' = './modules/storage-accounts.bicep'

module app-service-plan {
  appServicePlan appServicePlanName {
    kind = 'B1'
    location = resourceGroup().location
  }
}

if (deployApp) {
  module web-app {
    appService webAppName {
      kind = 'web'
      appServicePlanId = appServicePlanName.id
      location = resourceGroup().location
      appSettings = {
        MYSECRET = secrets('MYSECRET')
      }
    }
  }
}

storage-accounts storageAccountNames
app-service-plan
if (deployApp) { web-app }
