resource "azurerm_resource_group" "platform" {
  name     = "rg-azdevsecops-dev"
  location = var.location

  tags = local.common_tags
}

locals {
  common_tags = {
    project     = "azure-devsecops-platform"
    environment = "dev"
    managed_by  = "terraform"
    owner       = "platform-engineering"
    cost_center = "devsecops"
  }
}

module "networking" {
  source = "../../modules/networking"

  resource_group_name = azurerm_resource_group.platform.name
  location            = azurerm_resource_group.platform.location

  vnet_name          = "vnet-azdevsecops-dev"
  vnet_address_space = "10.10.0.0/16"

  aks_system_subnet_prefix          = "10.10.1.0/24"
  aks_user_subnet_prefix            = "10.10.2.0/24"
  application_gateway_subnet_prefix = "10.10.3.0/24"
  private_endpoint_subnet_prefix    = "10.10.4.0/24"
  firewall_subnet_prefix            = "10.10.5.0/26"

  tags = local.common_tags
}

module "aks" {
  source = "../../modules/aks"

  cluster_name        = "aks-azdevsecops-dev"
  location            = azurerm_resource_group.platform.location
  resource_group_name = azurerm_resource_group.platform.name

  dns_prefix = "aks-azdevsecops-dev"

  aad_tenant_id              = var.aad_tenant_id
  aad_admin_group_object_ids = var.aad_admin_group_object_ids

  system_subnet_id = module.networking.aks_system_subnet_id
  user_subnet_id   = module.networking.aks_user_subnet_id

  system_vm_size = "Standard_D2s_v5"
  user_vm_size   = "Standard_D2s_v5"

  pod_cidr       = "10.244.0.0/16"
  service_cidr   = "10.250.0.0/16"
  dns_service_ip = "10.250.0.10"

  tags = local.common_tags
}

resource "random_string" "acr_suffix" {
  length  = 6
  special = false
  upper   = false
}

module "acr" {
  source = "../../modules/acr"

  registry_name       = "acrazdevsecopsdev${random_string.acr_suffix.result}"
  resource_group_name = azurerm_resource_group.platform.name
  location            = var.location

  tags = local.common_tags
}

module "github_ci_identity" {
  source = "../../modules/github-ci-identity"

  identity_name             = "id-azdevsecops-github-ci"
  resource_group_name       = azurerm_resource_group.platform.name
  location                  = azurerm_resource_group.platform.location
  federated_credential_name = "github-ci-infra-main"

  github_oidc_subject = "repo:Davintus@91970837/azure-devsecops-platform-infra@1348522429:ref:refs/heads/main"

  tags = local.common_tags
}

resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = module.acr.id
  role_definition_name = "AcrPull"
  principal_id         = module.aks.kubelet_identity_object_id
}

resource "azurerm_role_assignment" "github_ci_acr_push" {
  scope                = module.acr.id
  role_definition_name = "AcrPush"
  principal_id         = module.github_ci_identity.principal_id
}