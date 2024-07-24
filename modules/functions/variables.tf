variable "function_app_name" {
  description = "The Function App Name."
}

variable "funtion_worker_runtime" {
  description = "The name of the function app worker runtime."
  default     = ""
}

variable "funtion_worker_runtime_version" {
  description = "The name of the function app worker runtime version."
  default     = ""
}

variable "rg_name" {
  description = "The Function App Resource Group Name."
}

variable "location" {
  description = "The Function App Location to be created."
}

variable "storage_account_name" {
  description = "Storage Account name."
  default     = ""
}

variable "app_service_plan_os_type" {
  description = "The name of the App Service plan to create."
  default     = "Linux"
}

variable "app_service_plan_name" {
  description = "The name of the App Service plan to create."
  default     = ""
}

variable "app_service_sku_name" {
  description = "The name of the App Service plan to create."
  default     = "Y1"
}



