
resource "azurerm_public_ip" "pip" {
  name                = "${var.bastion_name}pip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion_host" {
  name                = "${var.bastion_name}"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                 = "${var.bastion_name}conf"
    subnet_id            = var.bastion_subnet_id
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}
