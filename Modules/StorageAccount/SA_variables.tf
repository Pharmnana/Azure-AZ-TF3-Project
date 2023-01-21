variable "resource_group" {
    type = string
  default = "devTFResourceGroup"
  description = "The name for the resource group where resources will domicile"
}

variable "location" {
    type = string
  default = "eastus"
  description = "The location for deployment"
}

variable "base_name" {
    type = string
    #default = "devTF-SA"
    description = "The storage account name"
  
}