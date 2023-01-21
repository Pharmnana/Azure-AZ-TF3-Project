# Configure the Azure provider and TF cloud
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"

  /*cloud {
    organization = "Pines"
    workspaces {
      name = "development-workspace"
    }
  }
*/
}

provider "azurerm" {
  features {}
}

#Resource group module block
module "ResourceGroup" {
  source         = "./Modules/ResourceGroup"
  resource_group = var.resource_group_name
  location       = var.location_name
}


module "StorageAccount" {
  source         = "./Modules/StorageAccount"
  base_name      = "devTFSA"
  resource_group = module.ResourceGroup.rg_name_out
  location       = var.location_name
}

module "VNet" {
  source              = "./Modules/VNet"
  resource_group_name = module.ResourceGroup.rg_name_out
  location_name       = var.location_name
}












/*#VNet module block
module "vnet" {
  source              = "Azure/vnet/azurerm"
  version             = "3.0.0"
  resource_group_name = "devTFResourceGroup"
  location_name       = "eastus"
}*/