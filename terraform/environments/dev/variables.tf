variable "location" {
  description = "Azure deployment region."
  type        = string
  default     = "westeurope"
}

variable "aad_tenant_id" {
  description = "Microsoft Entra tenant used by AKS."
  type        = string
  default     = "a7b5e0d1-3514-4206-8dc1-cee22c5bf353"
}

variable "aad_admin_group_object_ids" {
  description = "Microsoft Entra group object IDs allowed to administer AKS."
  type        = list(string)
  default     = ["ea141d56-ea6f-4953-ae6e-c4ae96a916c9"]
}