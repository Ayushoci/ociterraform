variable "compartment_id" {}
variable "network_load_balancer_ids" {}
variable "network_load_balancer_backend_set_map" {}

resource "oci_network_load_balancer_backend_set" "backend_set" {
for_each = var.network_load_balancer_backend_set_map

health_checker {
    protocol = each.value.health_check_protocol
    port = each.value.health_check_port
    interval_in_millis = each.value.interval_in_millis
    retries = each.value.retries
    timeout_in_millis = each.value.timeout_in_millis
    return_code = each.value.return_code
    response_data = each.value.response_data
}

network_load_balancer_id = var.network_load_balancer_ids[each.value.network_load_balancer_name]
name = each.value.display_name
policy = each.value.policy
is_preserve_source = each.value.is_preserve_source
ip_version = each.value.ip_version

}