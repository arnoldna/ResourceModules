targetScope = 'subscription'

// ========== //
// Parameters //
// ========== //

@description('Optional. The name of the resource group to deploy for a testing purposes')
@maxLength(90)
param resourceGroupName string = 'ms.compute.images-${serviceShort}-rg'

@description('Optional. The location to deploy resources to')
param location string = deployment().location

@description('Optional. A short identifier for the kind of deployment. Should be kept short to not run into resource-name length-constraints')
param serviceShort string = 'cicom'

// =========== //
// Deployments //
// =========== //

// General resources
// =================
resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

module resourceGroupResources 'dependencies.bicep' = {
  scope: resourceGroup
  name: '${uniqueString(deployment().name, location)}-paramNested'
  params: {
    managedIdentityName: 'dep-<<namePrefix>>-msi-${serviceShort}'
    storageAccountName: 'dep<<namePrefix>>sa${serviceShort}01'
    imageTemplateNamePrefix: 'dep-<<namePrefix>>-imgt-${serviceShort}'
    triggerImageDeploymentScriptName: 'dep-<<namePrefix>>-ds-${serviceShort}-triggerImageTemplate'
    copyVhdDeploymentScriptName: 'dep-<<namePrefix>>-ds-${serviceShort}-copyVhdToStorage'
  }
}

// ============== //
// Test Execution //
// ============== //
module testDeployment '../../deploy.bicep' = {
  scope: resourceGroup
  name: '${uniqueString(deployment().name, location)}-test-${serviceShort}'
  params: {
    name: '<<namePrefix>>${serviceShort}001'
    osAccountType: 'Premium_LRS'
    osDiskBlobUri: resourceGroupResources.outputs.vhdUri
    osDiskCaching: 'ReadWrite'
    osType: 'Windows'
    hyperVGeneration: 'V1'
    roleAssignments: [
      {
        principalIds: [
          resourceGroupResources.outputs.managedIdentityPrincipalId
        ]
        roleDefinitionIdOrName: 'Reader'
      }
    ]
    zoneResilient: true
  }
}
