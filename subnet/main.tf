module "subnet_module" {
  source = "./module"

  for_each = { for subnet in var.subnets : subnet.name => subnet }

  compartment_id    = var.compartment_id
  name             = each.value.name
  cidr_block       = each.value.cidr_block
  vcn_id           = each.value.vcn_id
  route_table_id   = each.value.route_table_id
  security_list_ids = each.value.security_list_ids
  #dhcp_options_id  = each.value.dhcp_options_id
  prohibit_public_ip_on_vnic = each.value.prohibit_public_ip_on_vnic
}
