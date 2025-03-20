variable "subscription_id" {
  description = "The subscription ID for the Azure account."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}


variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "function_app_name" {
  description = "The name of the Linux Function App."
  type        = string
}

variable "app_service_plan_name" {
  description = "The name of the App Service plan"
  type        = string
}

variable "app_insights_name" {
  description = "The name of the Application Insights instance"
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics workspace"
  type        = string
}

variable "key_vault_name" {
  description = "The name of the Key Vault"
  type        = string
}
variable "cosmosdb_account_name" {
  description = "The name of the CosmosDB account."
  type        = string
}

variable "ai_service_name" {
  description = "The name of the AI service."
  type        = string
}

variable "openai_service_name" {
  description = "The name of the Azure OpenAI service."
  type        = string
}
