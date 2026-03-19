output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "identity_id" {
  value = module.identity.identity_id
}

output "principal_id" {
  value = module.identity.principal_id
}

output "key_vault_uri" {
  value = module.keyvault.key_vault_uri
}

# Event Grid output removed for now because the eventgrid module
# is not declared yet. You can re-add it later when the module exists.