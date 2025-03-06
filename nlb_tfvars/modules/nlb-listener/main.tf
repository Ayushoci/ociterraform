variable "network_load_balancer_ids" {}
variable "network_load_balancer_listener_map" {}

resource "oci_network_load_balancer_listener" "listener" {
for_each = var.network_load_balancer_listener_map

default_backend_set_name = each.value.backend_set_name
network_load_balancer_id = var.network_load_balancer_ids[each.value.network_load_balancer_name]
name = each.value.listener_name
port = each.value.listener_port
protocol = each.value.listener_protocol
ip_version = each.value.ip_version
}