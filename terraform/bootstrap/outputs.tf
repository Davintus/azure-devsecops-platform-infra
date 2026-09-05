output "resource_group_name" {
  value = azurerm_resource_group.terraform_state.name
}

output "storage_account_name" {
  value = azurerm_storage_account.terraform_state.name
}

output "container_name" {
  value = azurerm_storage_container.terraform_state.name
}

output "github_actions_identity_client_id" {
  value = azurerm_user_assigned_identity.github_actions.client_id
}

output "github_actions_identity_principal_id" {
  value = azurerm_user_assigned_identity.github_actions.principal_id
}

output "github_actions_identity_resource_id" {
  value = azurerm_user_assigned_identity.github_actions.id
}