output "system_topic_id" {
  value = azurerm_eventgrid_system_topic.this.id
}

output "event_subscription_id" {
  value = azurerm_eventgrid_event_subscription.function_sub.id
}