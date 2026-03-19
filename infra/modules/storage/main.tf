resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_container" "incoming" {
  name                 = var.incoming_container_name
  storage_account_name = azurerm_storage_account.this.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "processed" {
  name                 = var.processed_container_name
  storage_account_name = azurerm_storage_account.this.name
  container_access_type = "private"
}