module "nat_gateway" {
  for_each       = { for nat in var.nat_gateways : nat.nat_name => nat }
  source         = "./module"

  compartment_id = each.value.compartment_id
  vcn_id         = each.value.vcn_id
  nat_name       = each.value.nat_name
}
