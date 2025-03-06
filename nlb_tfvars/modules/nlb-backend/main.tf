variable "network_load_balancer_ids" {}
variable "network_load_balancer_backend_map" {}

resource "oci_network_load_balancer_backend" "backend" {
    for_each = var.network_load_balancer_backend_map

    backend_set_name = each.value.backend_set_name
    target_id = each.value.backend_target_id
    network_load_balancer_id = var.network_load_balancer_ids[each.value.network_load_balancer_name]
    port = each.value.backend_port
}