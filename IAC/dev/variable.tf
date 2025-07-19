# Terraform Variables
variable "region" {
  description = "The AWS region to deploy the infrastructure"
  default     = "us-east-1"
}
variable "name" {
  description = "The name of the resource group"
  default     = "DevResourceGroup"
}
variable "location" {
  description = "The location of the resource group"
  default     = "East US"  # eastus1
}