variable "rg_name" {
    type = string
}
variable "location" {
    type = string
}
variable "sa_name" {
    type = string
}
variable "account_tier" {}
variable "account_kind" {default = "StorageV2"}
variable "account_replication_type" {}
variable "is_hns_enabled" { default = "false"}