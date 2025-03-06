# nlb/nlb.tf
resource "oci_network_load_balancer_network_load_balancer" "network_load_balancer" {
  compartment_id                 = var.compartment_id
  display_name                   = var.display_name
  subnet_id                      = var.subnet_id
  is_preserve_source_destination = var.is_preserve_source_destination
  is_private                     = var.is_private
  nlb_ip_version                 = var.nlb_ip_version
  defined_tags                   = var.defined_tags
}

