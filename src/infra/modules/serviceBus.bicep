// --- Parameters
@description('Service bus namespace name.')
param serviceBusNsName string

@description('The Azure region in which all resources should be deployed.')
param location string = resourceGroup().location

resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2021-06-01-preview' = {
  name: serviceBusNsName
  location: location
  sku: {
    name: 'Basic'
    capacity: 1
    tier: 'Basic'
  }
}

resource ingressTopic 'Microsoft.ServiceBus/namespaces/topics@2021-06-01-preview' = {
  parent: serviceBusNamespace
  name: 'equipment-ingress'
  properties: {
    enablePartitioning: true
  }
}

resource egressTopic 'Microsoft.ServiceBus/namespaces/topics@2021-06-01-preview' = {
  parent: serviceBusNamespace
  name: 'equipment-egress'
  properties: {
    enablePartitioning: true
  }
}

@description('The ID of the service bus namespace.')
output serviceBusId string = serviceBusNamespace.id

@description('The name of the service bus namespace.')
output serviceBusNamespaceName string = serviceBusNamespace.name
