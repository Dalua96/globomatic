variable "cognitive_search_name" {
  description = "The Coginitive search Name."
}

variable "rg_name" {
  description = "The Coginitive search Resource Group Name."
}

variable "location" {
  description = "The Coginitive search Location to be created."
}

variable "sku" {
description = "The Coginitive search SKU."
}

variable "local_authentication" {
description = " Specifies whether the Search Service allows authenticating using API Keys? Defaults to true"
type = bool
default = true
}