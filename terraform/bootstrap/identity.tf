resource "azurerm_user_assigned_identity" "github_actions" {
  name                = "id-azdevsecops-github-actions"
  resource_group_name = azurerm_resource_group.terraform_state.name
  location            = azurerm_resource_group.terraform_state.location

  tags = {
    project    = "azure-devsecops-platform"
    managed_by = "terraform"
    purpose    = "github-actions-oidc"
  }
}