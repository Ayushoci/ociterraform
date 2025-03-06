variable "load_balancer_id" { type = string }
variable "backendset_name" { type = string }
variable "listener_name" { type = string }
variable "listener_port" { type = number }
variable "listener_protocol" { type = string }

resource "oci_load_balancer_listener" "this" {
  load_balancer_id = var.load_balancer_id
  default_backend_set_name = var.backendset_name
  name = var.listener_name
  port = var.listener_port
  protocol = var.listener_protocol
}
