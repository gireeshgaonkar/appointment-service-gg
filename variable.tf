# Terraform Variables


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
  default     = "vnet"
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
  default     = "ResourceGroup-gg"
}
variable "location" {
  description = "The location of the resource group"
  default     = "East US"  # eastus1
}
variable "app_service_name" {
  description = "The name of the app service"
  default     = "appointment-service-gg"
}

variable "app_service_plan_name" {
  description = "The name of the app service plan"
  default     = "appointment-service-plan-gg"
  
}

variable "function_app_name" {
  description = "The name of the function app"
  default     = "appointment-service-FunctionApp-gg"
}

variable "app_storage_name" {
  description = "The name of the storage account"
  default     = "appointmentservicegg"
}

variable "dns_name" {
  description = "The DNS name for the function app"
  default     = "appointment-service-function-app-gg"
}

variable "dns_zone_name" {
  description = "The DNS zone name"
  default     = "appointment-service-gg.com"
}

variable "function_app_dns_name" {
  description = "The DNS name for the function app"
  default     = "appointment-service-function-app-gg"
} 

