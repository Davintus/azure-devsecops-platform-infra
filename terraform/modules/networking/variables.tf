variable "resource_group_name" {
  type        = string
  description = "Resource group for networking resources."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "vnet_name" {
  type        = string
  description = "Virtual network name."
}

variable "vnet_address_space" {
  type        = string
  description = "Virtual network CIDR."
}

variable "aks_system_subnet_prefix" {
  type        = string
  description = "AKS system subnet CIDR."
}

variable "aks_user_subnet_prefix" {
  type        = string
  description = "AKS user subnet CIDR."
}

variable "application_gateway_subnet_prefix" {
  type        = string
  description = "Application Gateway subnet CIDR."
}

variable "private_endpoint_subnet_prefix" {
  type        = string
  description = "Private endpoint subnet CIDR."
}

variable "firewall_subnet_prefix" {
  type        = string
  description = "Azure Firewall subnet CIDR."
}

variable "tags" {
  type        = map(string)
  description = "Resource tags."
  default     = {}
}