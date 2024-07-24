resource "azurerm_storage_account" "safunc" {
  name                     = var.storage_account_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "azfuncsp" {
  name                = var.function_app_name
  resource_group_name = var.rg_name
  location            = var.location
  os_type             = var.app_service_plan_os_type
  sku_name            = var.app_service_sku_name
}

resource "azurerm_linux_function_app" "azfuncapp" {
  name                 = var.function_app_name
  resource_group_name  = var.rg_name
  location             = var.location
  storage_account_name = azurerm_storage_account.safunc.name
  storage_account_access_key = azurerm_storage_account.safunc.primary_access_key
  service_plan_id      = azurerm_service_plan.azfuncsp.id
  app_settings = {

    "FUNCTIONS_WORKER_RUNTIME" = var.funtion_worker_runtime
  }

  site_config {
    application_stack {
      python_version = var.funtion_worker_runtime_version
    }
  }
}