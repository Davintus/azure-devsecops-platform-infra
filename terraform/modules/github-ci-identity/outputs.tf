output "client_id" {
  description = "Client ID of the GitHub Actions CI managed identity."
  value       = azurerm_user_assigned_identity.this.client_id
}

output "principal_id" {
  description = "Principal ID of the GitHub Actions CI managed identity."
  value       = azurerm_user_assigned_identity.this.principal_id
}

output "resource_id" {
  description = "Resource ID of the GitHub Actions CI managed identity."
  value       = azurerm_user_assigned_identity.this.id
}

output "federated_credential_id" {
  description = "Resource ID of the GitHub OIDC federated identity credential."
  value       = azurerm_federated_identity_credential.github.id
}