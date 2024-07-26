resource "azurerm_virtual_network" "azvn01" {
  name                = var.vnet_name
  resource_group_name = var.rg_name
  location            = var.location
  address_space       = [var.vnet_address]
  tags = var.common_tags

}

resource "azurerm_subnet" "azsnet01" {
  name                 = var.snet_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.azvn01.name
  address_prefixes     = [var.snet_address]

}