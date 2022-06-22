targetScope = 'subscription'

// ========== //
// Parameters //
// ========== //

// Resource Group
@description('Required. The name prefix to inject into all resource names')
param namePrefix string

@description('Optional. The name of the resource group to deploy for a testing purposes')
@maxLength(90)
param resourceGroupName string = '${serviceShort}-ms.analysisservices-servers-rg'

@description('Optional. The location to deploy resources to')
param location string = deployment().location

@description('Optional. A short identifier for the kind of deployment. E.g. "aspar". Should be kept short to not run into resource-name length-constraints')
param serviceShort string = 'asmin'

// =========== //
// Deployments //
// =========== //

// General resources
// =================
module resourceGroup '../../../Microsoft.Resources/resourceGroups/deploy.bicep' = {
  name: '${uniqueString(deployment().name, location)}-rg'
  params: {
    name: resourceGroupName
    location: location
  }
}

// ============== //
// Test Execution //
// ============== //

module servers '../deploy.bicep' = {
  scope: az.resourceGroup(resourceGroupName)
  name: '${uniqueString(deployment().name)}-servers-${serviceShort}'
  params: {
    name: '${namePrefix}azas${serviceShort}001'
  }
}