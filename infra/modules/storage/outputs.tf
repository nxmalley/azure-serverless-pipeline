output "storage_account_name" {
  value = azurerm_storage_account.this.name
}

output "storage_account_id" {
  value = azurerm_storage_account.this.id
}

output "incoming_container_name" {
  value = azurerm_storage_container.incoming.name
}

output "processed_container_name" {
  value = azurerm_storage_container.processed.name
}