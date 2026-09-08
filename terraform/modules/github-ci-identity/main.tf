resource "azurerm_user_assigned_identity" "this" {
  name                = var.identity_name
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = var.tags
}

resource "azurerm_federated_identity_credential" "github" {
  name = var.federated_credential_name

  user_assigned_identity_id = azurerm_user_assigned_identity.this.id

  issuer = "https://token.actions.githubusercontent.com"

  audience = [
    "api://AzureADTokenExchange"
  ]

  subject = var.github_oidc_subject
}