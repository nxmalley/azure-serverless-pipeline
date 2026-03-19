variable "storage_account_name" {
  type        = string
  description = "Storage account name. Must be 3-24 characters, lowercase letters and numbers only."
  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "storage_account_name must be 3-24 characters, lowercase letters and numbers only."
  }
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name where the storage account will be created."
  validation {
    condition     = length(trimspace(var.resource_group_name)) > 0 && length(var.resource_group_name) <= 90
    error_message = "resource_group_name must be a non-empty string up to 90 characters."
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

variable "incoming_container_name" {
  type        = string
  description = "Name of the incoming blob container. Must be 3-63 characters, lowercase letters, numbers, and hyphens; must start and end with a letter or number."
  validation {
    condition     = can(regex("^[a-z0-9](?:[a-z0-9-]{1,61}[a-z0-9])?$", var.incoming_container_name))
    error_message = "incoming_container_name must be 3-63 characters, lowercase letters, numbers, and hyphens; must start and end with a letter or number."
  }
}

variable "processed_container_name" {
  type        = string
  description = "Name of the processed blob container. Must be 3-63 characters, lowercase letters, numbers, and hyphens; must start and end with a letter or number."
  validation {
    condition     = can(regex("^[a-z0-9](?:[a-z0-9-]{1,61}[a-z0-9])?$", var.processed_container_name))
    error_message = "processed_container_name must be 3-63 characters, lowercase letters, numbers, and hyphens; must start and end with a letter or number."
  }
}