# specify the provide version
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# configure the provider
provider "azurerm" {    
    features {}
}

# create Azure function app with a resource group and app service plan
resource "azurerm_resource_group" "test" {
  name     = "DevResourceGroup"
  location = "East US"  # eastus1
}

# create Azure function app with a resource group and app service plan
resource "azurerm_resource_group" "test" {
  name     = "DevResourceGroup"
  location = "East US"  # eastus1
}
resource "azurerm_app_service_plan" "test" {
  name                = "dev-app-service-plan"
  location            = azurerm_resource_group.dev.location
  resource_group_name = azurerm_resource_group.dev.name
  sku {
    tier     = "Standard"
    size     = "S1"
  }
}

resource "azurerm_function_app" "test" {
  name                       = "Test-appointment-service-FunctionApp"
  location                   = azurerm_resource_group.test.location
  resource_group_name        = azurerm_resource_group.test.name
  app_service_plan_id        = azurerm_app_service_plan.test.id
  storage_account_name       = azurerm_storage_account.test.name
  storage_account_access_key = azurerm_storage_account.test.primary_access_key

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "node"
    WEBSITE_NODE_DEFAULT_VERSION = "~22"
  }
}


# output service plan ID
output "app_service_plan_id" {
  value = azurerm_app_service_plan.test.id
}   
# output function app name
output "function_app_name" {
  value = azurerm_function_app.test.name
}   
