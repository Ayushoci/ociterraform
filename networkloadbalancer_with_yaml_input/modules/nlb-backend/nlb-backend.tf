# nlb_backend/nlb_backend.tf
resource "oci_network_load_balancer_backend" "network_load_balancer_backend" {
  backend_set_name         = var.backend_set_name
  network_load_balancer_id = var.network_load_balancer_id
  port                     = var.backend_port
  target_id                = var.backend_target_id
  weight                   = var.weight
  is_backup                = var.is_backup
  is_drain                 = var.is_drain
  is_offline               = var.is_offline
}

