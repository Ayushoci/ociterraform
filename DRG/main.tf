module "drg" {
  for_each     = { for drg in var.drgs : drg.drg_name => drg }
  source       = "./module"
  drg_name     = each.value.drg_name
  compartment_id = each.value.compartment_id
}
