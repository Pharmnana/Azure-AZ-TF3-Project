# Create a virtual network
resource "azurerm_virtual_network" "dev-vnet" {
  name                = "devTFVnet"
  address_space       = var.address_space_name
  location            = var.location_name
  resource_group_name = var.resource_group_name
}

#creates subnets
resource "azurerm_subnet" "devTF-SN" {
  name                 = "devTF-pub-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.dev-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

#creates security group
resource "azurerm_network_security_group" "devTF-SG" {
  name                = "devTF-sg"
  location            = var.location_name
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "dev-rule-001"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    Environment = "Dev"
  }
}

#creates subnet assosiation
resource "azurerm_subnet_network_security_group_association" "devTF-SGa" {
  subnet_id                 = azurerm_subnet.devTF-SN.id
  network_security_group_id = azurerm_network_security_group.devTF-SG.id
}

#creates public IP
resource "azurerm_public_ip" "devTF-ip" {
  name                = "devTF-public-ip"
  resource_group_name = var.resource_group_name
  location            = var.location_name
  allocation_method   = "Dynamic"

  tags = {
    Environment = "Dev"
  }
}

#creates network interface
resource "azurerm_network_interface" "devTF-nic" {
  name                = "devTF-nic"
  location            = var.location_name
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.devTF-SN.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.devTF-ip.id
  }

  tags = {
    "Environment" = "Dev"
  }
}