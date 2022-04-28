# Site Config `[Microsoft.Web/sites/config-authsettingsv2]`

This module deploys the auth settings v2.

## Navigation

- [Resource Types](#Resource-Types)
- [Parameters](#Parameters)
- [Outputs](#Outputs)
- [Template references](#Template-references)

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.Web/sites/config` | 2020-12-01 |

## Parameters

**Required parameters**
| Parameter Name | Type | Allowed Values | Description |
| :-- | :-- | :-- | :-- |
| `appName` | string |  | Name of the site parent resource. |
| `authSettingV2Configuration` | object |  | The auth settings V2 configuration. |
| `kind` | string | `[functionapp, functionapp,linux, app]` | Type of site to deploy. |

**Optional parameters**
| Parameter Name | Type | Default Value | Description |
| :-- | :-- | :-- | :-- |
| `enableDefaultTelemetry` | bool | `True` | Enable telemetry via the Customer Usage Attribution ID (GUID). |


### Parameter Usage: `authSettingV2Configuration`

The auth settings V2 configuration.

```json
"siteConfig": {
    "value": [
        // Check out https://docs.microsoft.com/en-us/azure/templates/microsoft.web/sites/config-authsettingsv2?tabs=bicep#siteauthsettingsv2properties for possible properties
    ]
}
```

## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `name` | string | The name of the site config. |
| `resourceGroupName` | string | The resource group the site config was deployed into. |
| `resourceId` | string | The resource ID of the site config. |

## Template references

- ['sites/config' Parent Documentation](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Web/sites)
