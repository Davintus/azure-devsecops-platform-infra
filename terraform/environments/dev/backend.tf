terraform {
  backend "azurerm" {
    resource_group_name  = "rg-azdevsecops-tfstate"
    storage_account_name = "azdevsecopstfstate8271"
    container_name       = "tfstate"
    key                  = "dev/platform.tfstate"
    use_azuread_auth     = true
  }
}