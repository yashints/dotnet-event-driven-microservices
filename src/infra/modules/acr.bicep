@description('Container registry name.')
param name string

@description('Location of the container registry.')
param location string

@description('SKU of the container registry.')
param sku string = 'Premium'

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2021-06-01-preview' = {
  name: name
  location: location
  sku: {
    name: sku
  }
  properties: {    
    adminUserEnabled: true
  }
}
