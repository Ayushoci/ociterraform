module "internet_gateway" {
  for_each       = { for igw in var.internet_gateways : igw.igw_name => igw }
  source         = "./module"
  vcn_id         = each.value.vcn_id
  igw_name       = each.value.igw_name
  compartment_id = each.value.compartment_id
}
