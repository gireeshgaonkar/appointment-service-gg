
# create Azure function app with a resource group and app service plan
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.resource_group_name}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Create Public Subnet
resource "azurerm_subnet" "public" {
  name                 = "public-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create Private Subnet
resource "azurerm_subnet" "private" {
  name                 = "private-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}





resource "azurerm_app_service_plan" "service_plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier     = "Standard"
    size     = "S1"
  }
}

# create storage account for the function app
resource "azurerm_storage_account" "app_storage" {  
    name                     = var.app_storage_name
    resource_group_name      = azurerm_resource_group.rg.name
    location                 = azurerm_resource_group.rg.location
    account_tier             = "Standard"
    account_replication_type = "GRS"
    min_tls_version          = "TLS1_2"
    }

resource "azurerm_function_app" "function_app" {
  name                       = var.app_service_name
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  app_service_plan_id        = azurerm_app_service_plan.service_plan.id
  storage_account_name       = azurerm_storage_account.app_storage.name
  storage_account_access_key = azurerm_storage_account.app_storage.primary_access_key
  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "node"
    WEBSITE_NODE_DEFAULT_VERSION = "~22"
  }
}

#attach vnet to function app


resource "azurerm_dns_zone" "dns_zone" {
  name                = var.dns_zone_name
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_dns_cname_record" "dns_record" {
  name                = var.function_app_dns_name
  zone_name           = azurerm_dns_zone.dns_zone.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 300
  record              = azurerm_function_app.function_app.default_hostname
}
