variable "listener_name" {
  description = "The name for the Listener"
  type        = string
}

variable "backend_set_name" {
  description = "The name of the Backend Set to attach this Listener to"
  type        = string
}

variable "network_load_balancer_id" {
  description = "The OCID of the Network Load Balancer to create the Listener in"
  type        = string
}

variable "listener_port" {
  description = "The port for the Listener"
  type        = number
}

variable "listener_protocol" {
  description = "The protocol for the Listener (TCP or UDP)"
  type        = string
  default     = "TCP"
}

variable "ip_version" {
  description = "IP version for the Listener (IPV4 or IPV6)"
  type        = string
  default     = "IPV4"
}