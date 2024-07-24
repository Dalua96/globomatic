locals {
  project_name = "ibexh"
  environment  = "pre"
  region       = "eus"
  sa_name      = "${local.project_name}${local.environment}${local.region}sa"
}

resource "azurerm_storage_account" "azsa" {
  name                     = local.sa_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = var.account_tier
  account_kind             = var.account_kind
  account_replication_type = var.account_replication_type
  is_hns_enabled           = var.is_hns_enabled


}