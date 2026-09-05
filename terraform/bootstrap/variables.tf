variable "location" {
  description = "Azure region where the Terraform state resources will be deployed."
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "Resource group containing Terraform state resources."
  type        = string
  default     = "rg-azdevsecops-tfstate"
}

variable "storage_account_name" {
  description = "Globally unique Azure Storage Account name."
  type        = string
}

variable "github_org" {
  description = "GitHub username or organization owning the repository."
  type        = string
}

variable "github_repo" {
  description = "GitHub repository used by the Terraform pipeline."
  type        = string
}