variable "rg_name" {}
variable "location" {}
variable "sa_name" {}
variable "account_tier" {}
variable "account_kind" {default = "StorageV2"}
variable "account_replication_type" {}
variable "is_hns_enabled" { default = "false"}