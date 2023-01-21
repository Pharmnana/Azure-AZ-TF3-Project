# Create a resource group
resource "azurerm_resource_group" "dev-rg" {
  name     = "${var.resource_group}-001"
  location = var.location

  tags = {
    Environment = "Dev"
    Team        = "DevOps"
  }
}