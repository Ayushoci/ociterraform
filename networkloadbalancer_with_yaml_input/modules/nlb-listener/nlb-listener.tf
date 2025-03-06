# nlb_listener/nlb_listener.tf
resource "oci_network_load_balancer_listener" "network_load_balancer_listener" {
  default_backend_set_name = var.backend_set_name
  name                     = var.listener_name
  network_load_balancer_id = var.network_load_balancer_id
  port                     = var.listener_port
  protocol                 = var.listener_protocol
  ip_version               = var.ip_version
}

