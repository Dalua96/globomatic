
resource "azurerm_key_vault" "azkv01" {
  name                = var.kv_name
  resource_group_name = var.rg_name
  location            = var.location
  tenant_id           = var.tenantId
  sku_name            = var.sku_name

}