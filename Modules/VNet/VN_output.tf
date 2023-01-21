output "subnet_id" {
    value = azurerm_subnet.devTF-SN.id
}

output "VNet_id" {
    value = azurerm_virtual_network.dev-vnet.id 
}

output "dns_server" {
    value = azurerm_virtual_network.dev-vnet.dns_servers
}