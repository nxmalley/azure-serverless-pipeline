variable "service_plan_name" {
  type        = string
  description = "Name of the App Service plan for the Function App."
  validation {
    condition     = length(var.service_plan_name) > 0 && length(var.service_plan_name) <= 80
    error_message = "service_plan_name must be between 1 and 80 characters."
  }
}

variable "function_storage_account_name" {
  type        = string
  description = "Storage account name used by the Function App. Must be 3-24 lowercase letters and numbers."
  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.function_storage_account_name))
    error_message = "function_storage_account_name must be 3-24 characters, lowercase letters and numbers only."
  }
}

variable "function_app_name" {
  type        = string
  description = "Name of the Function App. Valid characters: letters, numbers, and hyphens; length 2-60."
  validation {
    condition     = can(regex("^[a-zA-Z0-9-]{2,60}$", var.function_app_name))
    error_message = "function_app_name must be 2-60 characters and may contain letters, numbers, and hyphens."
  }
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name where resources will be created."
  validation {
    condition     = length(var.resource_group_name) > 0 && length(var.resource_group_name) <= 90
    error_message = "resource_group_name must be between 1 and 90 characters."
  }
}

variable "location" {
  type        = string
  description = "Azure region (location) for resources, e.g. eastus."
  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "location must be a non-empty string."
  }
}

variable "identity_id" {
  type        = string
  description = "Resource ID of the user assigned managed identity to attach to the Function App (full ARM resource id)."
  validation {
    condition     = can(regex("^/subscriptions/.+", var.identity_id))
    error_message = "identity_id should be a full ARM resource id starting with '/subscriptions/'."
  }
}

variable "key_vault_uri" {
  type        = string
  description = "Key Vault URI to be injected into the Function App settings (e.g. https://myvault.vault.azure.net/)."
  validation {
    condition     = can(regex("^https?://[A-Za-z0-9.-]+/.*", var.key_vault_uri))
    error_message = "key_vault_uri must be a valid URI starting with http:// or https://."
  }
}

variable "system_topic_name" {
  type        = string
  description = "Name for the Event Grid system topic."
  validation {
    condition     = length(var.system_topic_name) > 0 && length(var.system_topic_name) <= 50
    error_message = "system_topic_name must be a non-empty string up to 50 characters."
  }
}

variable "subscription_name" {
  type        = string
  description = "Name for the Event Grid subscription."
  validation {
    condition     = length(var.subscription_name) > 0 && length(var.subscription_name) <= 80
    error_message = "subscription_name must be a non-empty string up to 80 characters."
  }
}