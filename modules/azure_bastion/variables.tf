variable "bastion_name" {
  description = "Specifies the name of the Bastion Host. Changing this forces a new resource to be created"
}

variable "bastion_subnet_id" {
  description = "Reference to a subnet in which this Bastion Host has been created. Changing this forces a new resource to be created, the subnet mask must be at least a /26."
}

variable "rg_name" {
  description = "The Azure bastion Resource Group Name."
}

variable "location" {
  description = "The Azure bastion Location to be created."
}