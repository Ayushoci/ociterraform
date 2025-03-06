variable "compartment_id" {}
#variable "dns_resolver_name" {}
#variable "vcn_id" {}
variable "dns_resolver_endpoints" {}

resource "oci_dns_resolver_endpoint" "dns_resolver_endpoints" {
  for_each = { for ep in var.dns_resolver_endpoints : ep.name => ep }

  resolver_id = each.value.resolver_id
  name        = each.value.name
  subnet_id   = each.value.subnet_id
  
  # Set is_listening and is_forwarding mutually exclusively
  is_listening = each.value.endpoint_type == "LISTENER" ? true : false
  is_forwarding = each.value.endpoint_type == "FORWARDER" ? true : false

  # Conditionally set forwarding address for FORWARDER type
  forwarding_address = each.value.endpoint_type == "FORWARDER" ? each.value.forwarding_address : null
  
  # Conditionally set listening address for LISTENER type
  listening_address = each.value.endpoint_type == "LISTENER" ? each.value.listening_address : null
}
