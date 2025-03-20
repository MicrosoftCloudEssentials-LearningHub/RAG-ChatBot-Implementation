# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Storage Account
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# CosmosDB
resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                = var.cosmosdb_account_name
  location            = azurerm_resource_group.cosmosdb.location
  resource_group_name = azurerm_resource_group.cosmosdb.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"
  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = azurerm_resource_group.cosmosdb.location
    failover_priority = 0
  }

  # Ensure the Cosmos DB Account depends on the Resource Group
  depends_on = [
    azurerm_resource_group.cosmosdb
  ]
}

# App Service Plan
resource "azurerm_app_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Standard"
    size = "S1"
  }
}

# App Service
resource "azurerm_app_service" "app" {
  name                = var.app_service_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id
}

# Key Vault
resource "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = var.tenant_id
  sku_name            = "standard"
}

# AI Services
resource "azurerm_cognitive_account" "ai" {
  name                = var.ai_service_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "CognitiveServices"
  sku_name            = "S1"
}

# Azure OpenAI
resource "azurerm_openai_service" "openai" {
  name                = var.openai_service_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "Standard"
}
