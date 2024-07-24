output "bastion_id" {
  value = azurerm_bastion_host.bastion_host.id
}

output "bastion_name" {
  value = azurerm_bastion_host.bastion_host.name
}

output "bastion_dns_name" {
  value = azurerm_bastion_host.bastion_host.dns_name
}