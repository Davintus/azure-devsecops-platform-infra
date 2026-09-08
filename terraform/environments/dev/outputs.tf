output "resource_group_name" {
  value = azurerm_resource_group.platform.name
}

output "vnet_id" {
  value = module.networking.vnet_id
}

output "aks_system_subnet_id" {
  value = module.networking.aks_system_subnet_id
}

output "aks_user_subnet_id" {
  value = module.networking.aks_user_subnet_id
}

output "acr_name" {
  description = "Azure Container Registry name."
  value       = module.acr.name
}

output "acr_login_server" {
  description = "Azure Container Registry login server."
  value       = module.acr.login_server
}

output "acr_id" {
  description = "Resource ID of the Azure Container Registry."
  value       = module.acr.id
}

output "github_ci_client_id" {
  description = "Client ID of the GitHub Actions CI managed identity."
  value       = module.github_ci_identity.client_id
}

output "github_ci_principal_id" {
  description = "Principal ID of the GitHub Actions CI managed identity."
  value       = module.github_ci_identity.principal_id
}