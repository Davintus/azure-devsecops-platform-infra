variable "registry_name" {
  description = "Globally unique Azure Container Registry name."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where the ACR will be deployed."
  type        = string
}

variable "location" {
  description = "Azure region for the ACR."
  type        = string
}

variable "tags" {
  description = "Tags applied to the ACR."
  type        = map(string)
  default     = {}
}