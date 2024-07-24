resource "azurerm_search_service" "cognitives" {
  name                = var.cognitive_search_name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = var.sku

  local_authentication_enabled = var.local_authentication
}