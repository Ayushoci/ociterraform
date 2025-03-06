variable "compartment_id" {
  type = string
}

variable "load_balancer_id" {
  type = string
}

variable "display_name" {
  type = string
}

variable "protocol" {
  type = string
}

# Health Check Variables
variable "health_check_protocol" {
  type = string
}

variable "health_check_port" {
  type = number
}

variable "health_check_path" {
  type = string
}

variable "health_check_interval_ms" {
  type = number
}

variable "health_check_timeout_ms" {
  type = number
}

variable "health_check_retries" {
  type = number
}

# Session Persistence Variables
variable "lb_cookie_session_persistence_enabled" {
  type = bool
}

variable "session_persistence_cookie_name" {
  type    = string
  default = null
}

resource "oci_load_balancer_backend_set" "this" {
  load_balancer_id = var.load_balancer_id
  name = var.display_name
  policy = "ROUND_ROBIN"  # Default policy, can be made configurable if needed

  health_checker {
    protocol = var.health_check_protocol
    port = var.health_check_port
    url_path = var.health_check_path
    interval_ms = var.health_check_interval_ms
    timeout_in_millis = var.health_check_timeout_ms
    retries = var.health_check_retries
  }

  # Session Persistence Configuration
  dynamic "session_persistence_configuration" {
    for_each = var.lb_cookie_session_persistence_enabled ? [1] : []
    content {
      cookie_name = var.session_persistence_cookie_name
      disable_fallback = false
    }
  }
}

output "backend_set_name" {
  value = oci_load_balancer_backend_set.this.name
}