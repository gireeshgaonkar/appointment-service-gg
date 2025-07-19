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
    subscription_id = var.subscription_id
    tenant_id      = var.tenant_id
}
