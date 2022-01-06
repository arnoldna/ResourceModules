# Load Balancer Inbound NAT Rules `[Microsoft.Network/loadBalancers/inboundNatRules]`

This module deploys load balancers inbound NAT rules.

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.Network/loadBalancers/inboundNatRules` | 2021-05-01 |

## Parameters

| Parameter Name | Type | Default Value | Possible Values | Description |
| :-- | :-- | :-- | :-- | :-- |
| `backendAddressPoolName` | string |  |  | Optional. Name of the backend address pool |
| `backendPort` | int | `[parameters('frontendPort')]` |  | Optional. The port used for the internal endpoint. |
| `cuaId` | string |  |  | Optional. Customer Usage Attribution ID (GUID). This GUID must be previously registered |
| `enableFloatingIP` | bool |  |  | Optional. Configures a virtual machine's endpoint for the floating IP capability required to configure a SQL AlwaysOn Availability Group. This setting is required when using the SQL AlwaysOn Availability Groups in SQL server. This setting can't be changed after you create the endpoint. |
| `enableTcpReset` | bool |  |  | Optional. Receive bidirectional TCP Reset on TCP flow idle timeout or unexpected connection termination. This element is only used when the protocol is set to TCP. |
| `frontendIPConfigurationName` | string |  |  | Required. The name of the frontend IP address to set for the inbound NAT rule |
| `frontendPort` | int |  |  | Required. The port for the external endpoint. Port numbers for each rule must be unique within the Load Balancer.  |
| `frontendPortRangeEnd` | int | `-1` |  | Optional. The port range end for the external endpoint. This property is used together with BackendAddressPool and FrontendPortRangeStart. Individual inbound NAT rule port mappings will be created for each backend address from BackendAddressPool. |
| `frontendPortRangeStart` | int | `-1` |  | Optional. The port range start for the external endpoint. This property is used together with BackendAddressPool and FrontendPortRangeEnd. Individual inbound NAT rule port mappings will be created for each backend address from BackendAddressPool. |
| `idleTimeoutInMinutes` | int | `4` |  | Optional. The timeout for the TCP idle connection. The value can be set between 4 and 30 minutes. The default value is 4 minutes. This element is only used when the protocol is set to TCP. |
| `loadBalancerName` | string |  |  | Required. The name of the parent load balancer |
| `name` | string |  |  | Required. The name of the inbound NAT rule |
| `protocol` | string | `Tcp` | `[All, Tcp, Udp]` | Optional. The transport protocol for the endpoint. |

## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `inboundNatRuleName` | string | The name of the inbound NAT rule |
| `inboundNatRuleResourceGroupName` | string | The resource group the inbound NAT rule was deployed into |
| `inboundNatRuleResourceId` | string | The resource ID of the inbound NAT rule |

## Template references

- [Loadbalancers/Inboundnatrules](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Network/loadBalancers/inboundNatRules)