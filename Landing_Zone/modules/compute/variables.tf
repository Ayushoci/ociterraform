// Module note:
// Values are passed from root variables. Update root terraform.tfvars, not this file,
// unless you intentionally want to change module defaults.

variable "create_compute" {
  description = "If true, create one compute instance."
  type        = bool
  default     = false
}

variable "tenancy_ocid" {
  description = "Tenancy OCID, required to fetch availability domains."
  type        = string
}

variable "compartment_id" {
  type = string
}

variable "subnet_id" {
  description = "Subnet where compute instance will be launched."
  type        = string
}

variable "availability_domain_index" {
  description = "Zero-based AD index."
  type        = number
  default     = 0
}

variable "instance_display_name" {
  type    = string
  default = "lz-instance"
}

variable "shape" {
  type    = string
  default = "VM.Standard.E4.Flex"
}

variable "ocpus" {
  type    = number
  default = 1
}

variable "memory_in_gbs" {
  type    = number
  default = 8
}

variable "assign_public_ip" {
  type    = bool
  default = true
}

variable "image_ocid" {
  description = "Boot image OCID for the selected region. If empty, latest platform image is selected from image_operating_system and image_operating_system_version."
  type        = string
  default     = ""
}

variable "image_operating_system" {
  description = "Operating system name used for auto image selection when image_ocid is empty."
  type        = string
  default     = "Oracle Linux"
}

variable "image_operating_system_version" {
  description = "Operating system version used for auto image selection when image_ocid is empty."
  type        = string
  default     = "8"
}

variable "ssh_public_key" {
  description = "SSH public key content for instance login."
  type        = string
  default     = ""
}

variable "tags" {
  type    = map(string)
  default = {}
}
