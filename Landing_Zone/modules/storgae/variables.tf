// Module note:
// Values are passed from root variables. Update root terraform.tfvars, not this file,
// unless you intentionally want to change module defaults.

variable "create_bucket" {
  description = "If true, create object storage bucket."
  type        = bool
  default     = true
}

variable "compartment_id" {
  type = string
}

variable "bucket_name" {
  type    = string
  default = "lz-state-bucket"
}

variable "bucket_access_type" {
  type    = string
  default = "NoPublicAccess"
}

variable "storage_tier" {
  type    = string
  default = "Standard"
}

variable "tags" {
  type    = map(string)
  default = {}
}
