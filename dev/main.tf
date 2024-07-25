
locals {
  rg_name     = "1-efe857e4-playground-sandbox"
  project_name = "globomatic"
  environment  = "dev"
  region       = "eus"
  location    = "West US"
  pre_name    = "${local.project_name}${local.environment}${local.region}"
}

module "vnet" {
  source       = "../modules/vnet"
  rg_name      = local.rg_name
  location     = local.location
  vnet_name    = "${local.pre_name}vnet"
  vnet_address = "10.0.0.0/16"
  snet_name = "${local.pre_name}snet"
  snet_address = "10.0.1.0/24"
}

module "sa" {
  source   = "../modules/storageaccount"
  rg_name  = local.rg_name
  location = local.location
  sa_name  = "${local.pre_name}sa"
  account_tier = "Standard"
  #account_kind = "BlockBlobStorage"
  account_replication_type = "LRS"
  #is_hns_enabled = true


}


module "kv" {
  source   = "../modules/keyvault"
  rg_name  = data.azurerm_resource_group.rg.name
  location = local.location
  kv_name  = "${local.pre_name}kv001"
  tenantId = data.azurerm_client_config.current.tenant_id
  sku_name = "standard"

}

module "speech" {
  source   = "../modules/ai_speech"
  rg_name  = local.rg_name
  location = local.location
  speech_name = "${local.pre_name}spch"
  kind = "Speech"
  sku_name = "F0"
  

}

module "funcapp01" {
  source                = "../modules/functions"
  rg_name               = local.rg_name
  location              = local.location
  function_app_name     = "${local.pre_name}func"
  app_service_sku_name = "Y1"
  storage_account_name  = "${local.pre_name}safunc"
  app_service_plan_name = "${local.pre_name}aspfunc"
  funtion_worker_runtime = "python"
  funtion_worker_runtime_version = "3.10"

}


resource "azurerm_log_analytics_workspace" "law" {
  name                = "${local.pre_name}law"
  location            = local.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_monitor_diagnostic_setting" "dgs" {
  name               = "${local.pre_name}funcdgs"
  target_resource_id = module.funcapp01.function_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id
  metric {
    category = "AllMetrics"

  }
}
