output "resource_group_name" {
  description = "The name of the resource group."
  value       = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.storage.name
}

output "input_container_name" {
  description = "The name of the input container"
  value       = azurerm_storage_container.input_container.name
}

output "output_container_name" {
  description = "The name of the output container"
  value       = azurerm_storage_container.output_container.name
}

output "function_app_name" {
  description = "The name of the Linux Function App."
  value       = azurerm_linux_function_app.function_app.name
}

output "app_service_plan_name" {
  description = "The name of the Service Plan"
  value       = azurerm_service_plan.asp.name
}

output "app_insights_name" {
  description = "The name of the Application Insights instance"
  value       = azurerm_application_insights.appinsights.name
}

output "log_analytics_workspace_name" {
  description = "The name of the Log Analytics workspace"
  value       = azurerm_log_analytics_workspace.loganalytics.name
}

output "key_vault_name" {
  description = "The name of the Key Vault"
  value       = azurerm_key_vault.keyvault.name
}


output "cosmosdb_account_name" {
  description = "The name of the CosmosDB account."
  value       = azurerm_cosmosdb_account.cosmosdb.name
}

output "ai_service_name" {
  description = "The name of the AI service."
  value       = azurerm_cognitive_account.ai.name
}

output "openai_service_name" {
  description = "The name of the Azure OpenAI service."
  value       = azurerm_cognitive_account.openai.name
}
