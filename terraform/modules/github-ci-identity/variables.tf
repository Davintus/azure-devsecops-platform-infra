variable "identity_name" {
  description = "Name of the user-assigned managed identity used by GitHub Actions."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the GitHub Actions managed identity."
  type        = string
}

variable "location" {
  description = "Azure region where the managed identity is deployed."
  type        = string
}

variable "federated_credential_name" {
  description = "Name of the GitHub OIDC federated identity credential."
  type        = string
}

variable "github_oidc_subject" {
  description = "GitHub Actions OIDC subject trusted by Microsoft Entra ID."
  type        = string
}

variable "tags" {
  description = "Tags applied to the managed identity."
  type        = map(string)
  default     = {}
}