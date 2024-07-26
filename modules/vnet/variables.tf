variable "rg_name" {}
variable "location" {}
variable "vnet_address" {}
variable "snet_address" {}
variable "snet_name" {}
variable "vnet_name" {}

variable "common_tags" {
  type        = map(string)
  description = "Map of tags to be applied to all resources"
  default     = {}
}
