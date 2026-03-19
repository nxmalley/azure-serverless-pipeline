
# Resource group
resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
}

# Managed identity
module "identity" {
  source              = "./modules/identity"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  identity_name       = var.identity_name
}

# Key Vault
module "keyvault" {
  source              = "./modules/keyvault"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  key_vault_name      = var.key_vault_name
  tenant_id           = var.tenant_id
  identity_principal_id = module.identity.principal_id
}

# Storage account + containers for pipeline
module "storage" {
  source               = "./modules/storage"
  resource_group_name  = azurerm_resource_group.this.name
  location             = azurerm_resource_group.this.location
  storage_account_name = var.storage_account_name

  incoming_container_name  = var.incoming_container_name
  processed_container_name = var.processed_container_name
}

# Function app + function storage
module "function" {
  source = "./modules/function"

  # required inputs - replace values as appropriate
  service_plan_name               = var.service_plan_name
  function_storage_account_name   = module.storage.storage_account_name
  function_app_name               = var.function_app_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  identity_id                     = module.identity.identity_id
  key_vault_uri                   = module.keyvault.key_vault_uri

  # Fix: pass the two variables reported missing by terraform validate
  system_topic_name               = var.system_topic_name
  subscription_name               = var.subscription_name
}