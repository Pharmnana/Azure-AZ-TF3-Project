output "SAActName" {
  value = module.StorageAccount.SA-name_out
}

output "RgName" {
  value = module.ResourceGroup.rg_name_out
}

output "VNet_id" {
  value = module.VNet.VNet_id

}

output "VNet_dns_server" {
  value = module.VNet.dns_server

}

output "Subnet_id" {
  value = module.VNet.subnet_id

}