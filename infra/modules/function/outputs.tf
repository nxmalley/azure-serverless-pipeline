output "function_app_id" {
  value = azurerm_windows_function_app.this.id
}

output "function_app_name" {
  value = azurerm_windows_function_app.this.name
}

output "function_app_default_hostname" {
  value = azurerm_windows_function_app.this.default_hostname
}