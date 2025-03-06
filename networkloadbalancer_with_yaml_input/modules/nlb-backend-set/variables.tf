variable "display_name" {
  description = "The display name for the Backend Set"
  type        = string
}

variable "network_load_balancer_id" {
  description = "The OCID of the Network Load Balancer to create the Backend Set in"
  type        = string
}

variable "health_check_protocol" {
  description = "The protocol for health check (HTTP, TCP, or UDP)"
  type        = string
  default     = "TCP"
}

variable "health_check_port" {
  description = "The port for health check"
  type        = number
  default     = 80
}

variable "policy" {
  description = "The policy for the Backend Set (FIVE_TUPLE, THREE_TUPLE, TWO_TUPLE, or ROUND_ROBIN)"
  type        = string
  default     = "ROUND_ROBIN"
}

variable "is_preserve_source" {
  description = "Whether to preserve the source IP address"
  type        = bool
  default     = true
}

variable "ip_version" {
  description = "IP version for the Backend Set (IPV4 or IPV6)"
  type        = string
  default     = "IPV4"
}

variable "interval_in_millis" {
  description = "The interval between health checks in milliseconds"
  type        = number
  default     = 10000
}

variable "retries" {
  description = "The number of retries for health check"
  type        = number
  default     = 3
}

variable "timeout_in_millis" {
  description = "The timeout for health check in milliseconds"
  type        = number
  default     = 3000
}

variable "return_code" {
  description = "The return code for health check"
  type        = number
  default     = 200
}

variable "response_data" {
  description = "The response data for health check"
  type        = string
  default     = ""
}