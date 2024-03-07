// --- Parameters
@description('Define the iotHub name.')
param iotHubName string

@description('The Azure region in which all resources should be deployed.')
param location string = resourceGroup().location

@description('The SKU to use for the IoT Hub.')
param skuName string = 'S1'

@description('The number of IoT Hub units.')
param skuUnits int = 1

@description('Define service bus ID.')
param serviceBusId string

@description('Define service bus name.')
param serviceBusName string

// --- Variables
var serviceBusConnectionString = listKeys(serviceBusId, '2022-09-01').primaryConnectionString

// --- Resources
resource IoTHub 'Microsoft.Devices/IotHubs@2021-07-02' = {
  name: iotHubName
  location: location
  sku: {
    name: skuName
    capacity: skuUnits
  }
  properties: {
    eventHubEndpoints: {
      events: {
        retentionTimeInDays: 1
        partitionCount: 4
      }
    }
    routing: {
      endpoints: {
        serviceBusTopics: [
          {
            name: 'equipment-ingress'
            connectionString: serviceBusConnectionString
            authenticationType: 'keyBased'
            endpointUri: 'sb://${serviceBusName}.servicebus.windows.net/'
          }
          {
            name: 'equipment-egress'
            connectionString: serviceBusConnectionString
            authenticationType: 'keyBased'
            endpointUri: 'sb://${serviceBusName}.servicebus.windows.net/'
          }
        ]
      }
      routes: [
        {
          name: 'equipment-ingress'
          source: 'DeviceMessages'
          endpointNames: [
            'equipment-ingress'
          ]
          isEnabled: true
        }
        {
          name: 'equipment-egress'
          source: 'DeviceMessages'
          endpointNames: [
            'equipment-egress'
          ]
          isEnabled: true
        }
      ]
    }
  }
}
