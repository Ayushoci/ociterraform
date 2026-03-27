// Variables used by the block volume and attachment configuration

variable "availability_domain" {
  description = "The availability domain to create the volume in (must match the instance's AD)"
  type        = string
}

variable "compartment_id" {
  description = "The Compartment OCID where the volume will be created"
  type        = string
}

variable "instance_id" {
  description = "OCID of the instance to attach the volume to"
  type        = string
}

variable "volume_display_name" {
  description = "Display name for the volume"
  type        = string
  default     = "example-volume"
}

variable "volume_size_in_gbs" {
  description = "Size of the volume in GBs"
  type        = number
  default     = 50
  validation {
    condition     = var.volume_size_in_gbs > 0
    error_message = "volume_size_in_gbs must be greater than 0"
  }
}

