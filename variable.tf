# Terraform Variables

variable "subscription_id" {
  description = "The Azure subscription ID"
  default     = "your-subscription-id"
}
variable "tenant_id" {
  description = "The Azure tenant ID"
  default     = "your-tenant-id"
}

variable "env" {
  description = "The environment for the deployment"
  default     = "dev"
}
variable "region" {
  description = "The azure region to deploy the infrastructure"
  default     = "us-east-1"
}


variable "vnet_name" {
  description = "The name of the virtual network"
  default     = "${env}-vnet"
}

variable "address_prefixes" {
  description = "The address prefixes for the virtual network"
  default     = ["10.0.0.0/16"]
}
variable "public_subnet_prefix" {
  description = "The address prefix for the public subnet"
  default     = ["10.0.1.0/24"]
}

variable "private_subnet_prefix" {
  description = "The address prefix for the private subnet"
  default     = ["10.0.2.0/24"]
}

variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "${env}_ResourceGroup"
}
variable "location" {
  description = "The location of the resource group"
  default     = "East US"  # eastus1
}
variable "app_service_name" {
  description = "The name of the app service"
  default     = "${env}AppService"
}

variable "app_service_plan_name" {
  description = "The name of the app service plan"
  default     = "${env}-app-service-plan"
  
}

variable "function_app_name" {
  description = "The name of the function app"
  default     = "${env}-appointment-service-FunctionApp"
}

variable "app_storage_name" {
  description = "The name of the storage account"
  default     = "${env}StorageAccount"
}

variable "dns_name" {
  description = "The DNS name for the function app"
  default     = "${env}-function-app"
}

variable "dns_zone_name" {
  description = "The DNS zone name"
  default     = "${env}.${app_service_name}.com"
}

variable "function_app_dns_name" {
  description = "The DNS name for the function app"
  default     = "${env}-function-app.${dns_zone_name}"
} 
