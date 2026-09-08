output "vnet_id" {
  description = "Virtual network resource ID."
  value       = azurerm_virtual_network.this.id
}

output "vnet_name" {
  description = "Virtual network name."
  value       = azurerm_virtual_network.this.name
}

output "aks_system_subnet_id" {
  description = "AKS system subnet ID."
  value       = azurerm_subnet.aks_system.id
}

output "aks_user_subnet_id" {
  description = "AKS user subnet ID."
  value       = azurerm_subnet.aks_user.id
}

output "application_gateway_subnet_id" {
  description = "Application Gateway subnet ID."
  value       = azurerm_subnet.application_gateway.id
}

output "private_endpoint_subnet_id" {
  description = "Private endpoint subnet ID."
  value       = azurerm_subnet.private_endpoints.id
}