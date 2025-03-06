variable "compartment_id" {
  description = "The OCID of the compartment for the Network Load Balancer"
  type        = string
}

variable "display_name" {
  description = "The display name for the Network Load Balancer"
  type        = string
}

variable "subnet_id" {
  description = "The OCID of the subnet to create the Network Load Balancer in"
  type        = string
}

variable "is_preserve_source_destination" {
  description = "Whether to preserve the source destination"
  type        = bool
  default     = true
}

variable "is_private" {
  description = "Whether the Network Load Balancer is private"
  type        = bool
  default     = false
}

variable "nlb_ip_version" {
  description = "IP version for the Network Load Balancer (IPV4 or IPV6)"
  type        = string
  default     = "IPV4"
}

variable "defined_tags" {
  description = "Defined tags for this resource"
  type        = map(string)
  default     = {}
}
