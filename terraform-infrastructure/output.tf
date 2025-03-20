output "resource_group_name" {
  description = "The name of the resource group."
  value       = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  description = "The name of the storage account."
  value       = azurerm_storage_account.storage.name
}

output "cosmosdb_account_name" {
  description = "The name of the CosmosDB account."
  value       = azurerm_cosmosdb_account.cosmosdb.name
}

output "app_service_name" {
  description = "The name of the App Service."
  value       = azurerm_app_service.app.name
}

output "key_vault_name" {
  description = "The name of the Key Vault."
  value       = azurerm_key_vault.kv.name
}

output "ai_service_name" {
  description = "The name of the AI service."
  value       = azurerm_cognitive_account.ai.name
}

output "openai_service_name" {
  description = "The name of the Azure OpenAI service."
  value       = azurerm_openai_service.openai.name
}
