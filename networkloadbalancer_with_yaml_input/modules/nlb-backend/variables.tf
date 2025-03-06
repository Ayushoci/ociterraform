variable "backend_set_name" {
  description = "The name of the Backend Set to attach this Backend to"
  type        = string
}

variable "network_load_balancer_id" {
  description = "The OCID of the Network Load Balancer to create the Backend in"
  type        = string
}

variable "backend_port" {
  description = "The port for the Backend"
  type        = number
  default     = 80
}

variable "backend_target_id" {
  description = "The OCID of the Backend target (compute instance, etc.)"
  type        = string
}

variable "weight" {
  description = "The weight for the Backend"
  type        = number
  default     = 1
}

variable "is_backup" {
  description = "Whether the Backend is a backup"
  type        = bool
  default     = false
}

variable "is_drain" {
  description = "Whether the Backend is draining"
  type        = bool
  default     = false
}

variable "is_offline" {
  description = "Whether the Backend is offline"
  type        = bool
  default     = false
}
