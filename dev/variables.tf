variable "owner" {
  description = "default tag"
  default     = "GLOBOMATIC"
}

# Common tags
variable "common_tags" {
  type        = map(string)
  description = "Map of tags to be applied to all resources"
  default     = {}
}