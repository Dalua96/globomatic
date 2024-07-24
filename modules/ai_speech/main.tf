resource "azurerm_cognitive_account" "azaispch" {
  name                = var.speech_name
  location            = var.location
  resource_group_name = var.rg_name
  kind                = var.kind

  sku_name = var.sku_name

}