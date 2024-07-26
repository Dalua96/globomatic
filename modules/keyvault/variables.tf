variable "rg_name" {}
variable "location" {}
variable "tenantId" {}
variable "kv_name" {}
variable "sku_name" {}

variable "common_tags" {
  type        = map(string)
  description = "Map of tags to be applied to all resources"
  default     = {}
}