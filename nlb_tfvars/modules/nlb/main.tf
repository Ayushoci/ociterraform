variable "compartment_id" {}
variable "network_load_balancer_map" {}

resource "oci_network_load_balancer_network_load_balancer" "network_load_balancer" {
    for_each = var.network_load_balancer_map
    compartment_id = var.compartment_id
    display_name = each.value.display_name
    is_preserve_source_destination = each.value.is_preserve_source_destination
    subnet_id = each.value.subnet_id
    defined_tags = each.value.defined_tags
    is_private = each.value.is_private
    nlb_ip_version = each.value.nlb_ip_version
}

output "network_load_balancer_ids" {
    value = {for nlb in oci_network_load_balancer_network_load_balancer.network_load_balancer : nlb.display_name => nlb.id}
}