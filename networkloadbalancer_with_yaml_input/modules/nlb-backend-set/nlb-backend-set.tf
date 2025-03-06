# nlb_backend_set/nlb_backend_set.tf
resource "oci_network_load_balancer_backend_set" "network_load_balancer_backend_set" {
  health_checker {
    protocol          = var.health_check_protocol
    port              = var.health_check_port
    interval_in_millis = var.interval_in_millis
    timeout_in_millis = var.timeout_in_millis
    retries           = var.retries
    return_code       = var.return_code
    response_body_regex = ""
    url_path          = ""
    request_data      = ""
    response_data     = var.response_data
  }

  name                     = var.display_name
  network_load_balancer_id = var.network_load_balancer_id
  policy                   = var.policy
  is_preserve_source       = var.is_preserve_source
  ip_version               = var.ip_version
}

