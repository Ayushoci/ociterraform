variable "vcn_var" {}

resource "oci_core_vcn" "vcn" {
    for_each = var.vcn_var 
    cidr_blocks = [each.value.vcn_cidr_block]
    compartment_id = each.value.vcn_compartment_id
    display_name    = each.value.vcn_display_name
    dns_label       = each.value.vcn_dns_label
    defined_tags    = each.value.var_defined_tags
}