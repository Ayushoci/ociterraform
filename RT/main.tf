module "route_tables" {
  source = "./module"

  for_each = { for rt in var.route_tables : rt.name => rt }

  name            = each.value.name
  compartment_id  = each.value.compartment_id
  vcn_id          = each.value.vcn_id
  route_rules     = each.value.route_rules
}
