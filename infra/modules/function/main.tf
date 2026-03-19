resource "azurerm_service_plan" "this" {
  name                = var.service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Windows"
  sku_name            = "B1"
}

resource "azurerm_storage_account" "function_storage" {
  name                     = var.function_storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_windows_function_app" "this" {
  name                = var.function_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.this.id

  storage_account_name       = azurerm_storage_account.function_storage.name
  storage_account_access_key = azurerm_storage_account.function_storage.primary_access_key

  identity {
    type         = "UserAssigned"
    identity_ids = [var.identity_id]
  }

  site_config {}

  functions_extension_version = "~4"

  app_settings = {
    "AzureWebJobsStorage"      = azurerm_storage_account.function_storage.primary_connection_string
    "FUNCTIONS_WORKER_RUNTIME" = "python"
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
    "WEBSITE_PYTHON_VERSION"   = "3.10"
    "KEY_VAULT_URI"            = var.key_vault_uri
  }
}