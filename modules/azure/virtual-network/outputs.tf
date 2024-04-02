output "vnet" {
  description = "The Virtual Network created for the Datadog agentless scanner"
  value       = azurerm_virtual_network.vnet
}

output "subnet" {
  description = "The default subnet of the created Virtual Network"
  value       = azurerm_subnet.default_subnet
}

output "nat_public_ip" {
  description = "The public IP associated with the VPC's NAT"
  value       = azurerm_public_ip.natgw_ip.ip_address
}
