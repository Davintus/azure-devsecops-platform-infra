variable "cluster_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "aad_admin_group_object_ids" {
  type = list(string)
}

variable "aad_tenant_id" {
  type = string
}

variable "kubernetes_version" {
  type    = string
  default = null
}

variable "system_subnet_id" {
  type = string
}

variable "user_subnet_id" {
  type = string
}

variable "system_vm_size" {
  type    = string
  default = "Standard_D2s_v5"
}

variable "user_vm_size" {
  type    = string
  default = "Standard_D2s_v5"
}

variable "pod_cidr" {
  type    = string
  default = "10.244.0.0/16"
}

variable "service_cidr" {
  type    = string
  default = "10.250.0.0/16"
}

variable "dns_service_ip" {
  type    = string
  default = "10.250.0.10"
}

variable "tags" {
  type    = map(string)
  default = {}
}