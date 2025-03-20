# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  # Output the resource group name
  provisioner "local-exec" {
    command = "echo Resource Group: ${self.name}"
  }
}
# Storage Account
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  depends_on = [azurerm_resource_group.rg]

  # Output the storage account name
  provisioner "local-exec" {
    command = "echo Storage Account: ${self.name}"
  }
}

# Blob Container for Input Files
resource "azurerm_storage_container" "input_container" {
  name                  = "input"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"

  depends_on = [azurerm_storage_account.storage]

  # Output the container name
  provisioner "local-exec" {
    command = "echo Input Container: ${self.name}"
  }
}

# Blob Container for Output Files
resource "azurerm_storage_container" "output_container" {
  name                  = "output"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"

  depends_on = [azurerm_storage_account.storage]

  # Output the container name
  provisioner "local-exec" {
    command = "echo Output Container: ${self.name}"
  }
}

# Linux Function App
resource "azurerm_linux_function_app" "function_app" {
  name                       = var.function_app_name
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  service_plan_id            = azurerm_service_plan.asp.id
  storage_account_name       = azurerm_storage_account.storage.name
  storage_account_access_key = azurerm_storage_account.storage.primary_access_key

  site_config {
    # Other configurations can go here
  }

  depends_on = [azurerm_service_plan.asp]

  provisioner "local-exec" {
    command = "echo Function App: ${self.name}"
  }
}


# Service Plan
resource "azurerm_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "Y1" # Consumption plan

  depends_on = [azurerm_resource_group.rg]

  # Output the service plan name
  provisioner "local-exec" {
    command = "echo Service Plan: ${self.name}"
  }
}

# Application Insights
resource "azurerm_application_insights" "appinsights" {
  name                = var.app_insights_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
  workspace_id        = azurerm_log_analytics_workspace.loganalytics.id

  depends_on = [azurerm_resource_group.rg]

  provisioner "local-exec" {
    command = "echo Application Insights: ${self.name}"
  }
}

# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "loganalytics" {
  name                = var.log_analytics_workspace_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"

  depends_on = [azurerm_resource_group.rg]

  # Output the log analytics workspace name
  provisioner "local-exec" {
    command = "echo Log Analytics Workspace: ${self.name}"
  }
}

# Key Vault
resource "azurerm_key_vault" "keyvault" {
  name                = var.key_vault_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  depends_on = [azurerm_resource_group.rg]

  # Output the key vault name
  provisioner "local-exec" {
    command = "echo Key Vault: ${self.name}"
  }
}

# Data source to get tenant ID
data "azurerm_client_config" "current" {}

# CosmosDB
resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                = var.cosmosdb_account_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"
  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = azurerm_resource_group.rg.location
    failover_priority = 0
  }

  depends_on = [azurerm_resource_group.rg]
}

# AI Services
resource "azurerm_cognitive_account" "ai" {
  name                = var.ai_service_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "CognitiveServices"
  sku_name            = "S0"
}

# Azure OpenAI
resource "azurerm_cognitive_account" "openai" {
  name                = var.openai_service_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "OpenAI"
  sku_name            = "S0"
}
