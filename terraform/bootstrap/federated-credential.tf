resource "azurerm_federated_identity_credential" "github_actions" {
  name                = "github-actions-infra"
  resource_group_name = azurerm_resource_group.terraform_state.name

  parent_id = azurerm_user_assigned_identity.github_actions.id

  audience = [
    "api://AzureADTokenExchange"
  ]

  issuer = "https://token.actions.githubusercontent.com"

  subject = "repo:${var.github_org}/${var.github_repo}:ref:refs/heads/main"
}