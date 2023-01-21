variable "address_space_name" {
  default = ["10.0.0.0/16"]
}

variable "location_name" {
  description = "resource location"
  type = string
  default = "eastus"
}

variable "resource_group_name" {
  description = "The resource group name"
  type = string
}