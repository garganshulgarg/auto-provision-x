variable "name" {
  description = "Name of the GCP Virtual Machine"
  type        = string
}
variable "description" {
  description = "Description of the GCP Virtual Machine"
  type        = string
}
variable "allowed_source_ranges" {
  description = "Allowed IP ranges"
  type        = list(string)
}

variable "required_tags" {
  description = "Labels which will get added to virtual machine"
  type        = map(string)
  default     = {}
}