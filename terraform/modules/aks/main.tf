resource "azurerm_kubernetes_cluster" "this" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  kubernetes_version = var.kubernetes_version

  role_based_access_control_enabled = true

  local_account_disabled = true

  azure_active_directory_role_based_access_control {
    admin_group_object_ids = var.aad_admin_group_object_ids
    azure_rbac_enabled     = true
    tenant_id              = var.aad_tenant_id
  }

  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name                 = "system"
    vm_size              = var.system_vm_size
    vnet_subnet_id       = var.system_subnet_id
    auto_scaling_enabled = true
    min_count            = 2
    max_count            = 3

    type = "VirtualMachineScaleSets"

    upgrade_settings {
      max_surge = "10%"
    }

    node_labels = {
      "workload-type" = "system"
    }

    tags = var.tags
  }

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"

    network_policy = "azure"

    load_balancer_sku = "standard"

    pod_cidr       = var.pod_cidr
    service_cidr   = var.service_cidr
    dns_service_ip = var.dns_service_ip
  }

  azure_policy_enabled = true

  tags = var.tags
}

resource "azurerm_kubernetes_cluster_node_pool" "user" {
  name                  = "user"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id

  vm_size = var.user_vm_size

  vnet_subnet_id = var.user_subnet_id

  auto_scaling_enabled = true
  min_count            = 1
  max_count            = 3

  mode = "User"

  upgrade_settings {
    max_surge = "10%"
  }

  node_labels = {
    "workload-type" = "application"
  }

  tags = var.tags
}