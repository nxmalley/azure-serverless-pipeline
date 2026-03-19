variable "key_vault_name" {
  type        = string
  description = "Name of the Key Vault. Must be 3-24 characters, letters, numbers, and hyphens."
  validation {
    condition     = can(regex("^[a-zA-Z0-9-]{3,24}$", var.key_vault_name))
    error_message = "key_vault_name must be 3-24 characters and may contain letters, numbers, and hyphens only."
  }
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name where the Key Vault will be created."
  validation {
    condition     = length(trimspace(var.resource_group_name)) > 0 && length(var.resource_group_name) <= 90
    error_message = "resource_group_name must be a non-empty string up to 90 characters."
  }
}

variable "location" {
  type        = string
  description = "Azure region (location) for the Key Vault, e.g. eastus."
  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "location must be a non-empty string."
  }
}

variable "tenant_id" {
  type        = string
  description = "Azure AD tenant ID (GUID) that owns the Key Vault."
  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.tenant_id))
    error_message = "tenant_id must be a valid GUID."
  }
}

variable "identity_principal_id" {
  type        = string
  description = "Object (principal) ID of the user assigned managed identity to grant access to the Key Vault."
  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.identity_principal_id))
    error_message = "identity_principal_id must be a valid GUID (object id)."
  }
}