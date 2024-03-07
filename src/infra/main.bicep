// --- Parameters
@description('The Azure region in which all resources should be deployed.')
param location string = resourceGroup().location

// --- Storage account
module serviceBus 'modules/serviceBus.bicep' = {
  name: 'storageAccountAux'
  params: {
    serviceBusNsName: uniqueString('sb', resourceGroup().id)
    location: location
  }
}

// --- IoT hub
module IoTHub 'modules/IoThub.bicep' = {
  name: 'IoTHub'
  params: {
    iotHubName: 'iothubeusmtaeda'
    location: location
    serviceBusId: serviceBus.outputs.serviceBusId
    serviceBusName: serviceBus.outputs.serviceBusNamespaceName
  }
}

module aks 'modules/aks.bicep' = {
  name: 'aks'
  params: {
    location: location
    linuxAdminUsername: 'aksuser'
    dnsPrefix: 'aks-mtaeda-1'
    sshRSAPublicKey: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD'
  }
}

module keyVault 'modules/kv.bicep' = {
  name: 'keyVault'
  params: {
    location: location
    name: 'kveusmtaeda'
    skuName: 'premium'
  }
}

module acr 'modules/acr.bicep' = {
  name: 'acr'
  params: {
    location: location
    name: 'acreusmtaeda01'
  }
}
