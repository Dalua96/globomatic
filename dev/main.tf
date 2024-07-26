
locals {
  rg_name     = "globomatic-eus-dev-01"
  project_name = "globomatic"
  environment  = "dev"
  region       = "eus"
  location    = "East US"
  pre_name    = "${local.project_name}${local.environment}${local.region}"
  common_tags = {
  project_name      = local.project_name
  billing_code = "CeCo2326"
  environment  = local.environment
  }

}

resource "random_integer" "sa" {
  min = 100
  max = 999
}

module "vnet" {
  source       = "../modules/vnet"
  rg_name      = local.rg_name
  location     = local.location
  vnet_name    = "${local.pre_name}vnet"
  vnet_address = "10.0.0.0/16"
  snet_name = "${local.pre_name}snet"
  snet_address = "10.0.1.0/24"
  common_tags = local.common_tags
}

module "sa" {
  source   = "../modules/storageaccount"
  rg_name  = local.rg_name
  location = local.location
  sa_name  = "${local.pre_name}sa${random_integer.sa.result}"
  account_tier = local.environment == "prod" ? "Premium" : "Standard"
  account_replication_type = "LRS"
  common_tags = local.common_tags

}


module "kv" {
  source   = "../modules/keyvault"
  rg_name  = data.azurerm_resource_group.rg.name
  location = local.location
  kv_name  = "${local.pre_name}kv${random_integer.sa.result}"
  tenantId = data.azurerm_client_config.current.tenant_id
  sku_name = "standard"
  common_tags = local.common_tags

}

# module "speech" {
#   source   = "../modules/ai_speech"
#   rg_name  = local.rg_name
#   location = local.location
#   speech_name = "${local.pre_name}spch"
#   kind = "Speech"
#   sku_name = "F0"
  
# }

module "funcapp01" {
  source                = "../modules/functions"
  rg_name               = local.rg_name
  location              = local.location
  function_app_name     = "${local.pre_name}fun"
  app_service_sku_name = "Y1"
  storage_account_name  = "glb${local.environment}${local.region}safun${random_integer.sa.result}"
  app_service_plan_name = "${local.pre_name}aspfunc"
  funtion_worker_runtime = "python"
  funtion_worker_runtime_version = "3.10"
  common_tags = local.common_tags

}


resource "azurerm_log_analytics_workspace" "law" {
  name                = "${local.pre_name}law"
  location            = local.location
  resource_group_name = data.azurerm_resource_group.rg.name

tags = local.common_tags
}

resource "azurerm_monitor_diagnostic_setting" "dgs" {
  name               = "${local.pre_name}funcdgs"
  target_resource_id = module.funcapp01.function_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id
  metric {
    category = "AllMetrics"

  }

}
