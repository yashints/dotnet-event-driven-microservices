@description('Key vault name.')
param name string

@description('Key vault location.')
param location string = resourceGroup().location

@description('Key vault SKU name.')
param skuName string = 'standard'

@description('Key vault SKU family.')
param family string = 'A'

resource keyVault 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: name
  location: location
  properties: {
    enabledForDeployment: true
    enabledForTemplateDeployment: true
    enabledForDiskEncryption: true
    enableSoftDelete: true
    softDeleteRetentionInDays: 7
    enableRbacAuthorization: true
    createMode: 'default'
    tenantId: subscription().tenantId
    sku: {
      name: skuName
      family: family
    }
  }
}
