# main.tf

# # Provider configuration
# provider "oci" {
#   tenancy_ocid     = var.tenancy_ocid
#   user_ocid        = var.user_ocid
#   fingerprint      = var.fingerprint
#   private_key_path = var.private_key_path
#   region           = var.region
# }

# Create multiple service gateways using a for loop to call the module
module "service_gateways" {
  source = "../module/sgw"
  
  for_each = { for idx, sgw in var.service_gateways : sgw.name => sgw }
  
  compartment_id = each.value.compartment_id
  name           = each.value.name
  vcn_id         = each.value.vcn_id
  route_table_id = each.value.route_table_id
}