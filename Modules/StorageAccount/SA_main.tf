terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.4.3"
    }
  }
}

resource "random_string" "random" {
    length = 6
    special = false
    upper = false
}


resource "azurerm_storage_account" "devTF-SA" {
  name                     = "${lower(var.base_name)}${random_string.random.result}"
  resource_group_name      = var.resource_group 
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "Dev"
  }
}