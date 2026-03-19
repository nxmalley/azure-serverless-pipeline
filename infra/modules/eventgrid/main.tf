resource "azurerm_eventgrid_system_topic" "this" {
  name                = var.system_topic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  source_arm_resource_id = var.storage_account_id
  topic_type             = "Microsoft.Storage.StorageAccounts"
}

resource "azurerm_eventgrid_event_subscription" "function_sub" {
  name  = var.subscription_name
  scope = azurerm_eventgrid_system_topic.this.id

  event_delivery_schema = "EventGridSchema"

  included_event_types = [
    "Microsoft.Storage.BlobCreated"
  ]

  azure_function_endpoint {
    function_id = var.function_id
  }
}