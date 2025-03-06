module "compartment" {
    source = "../module"
    compartment_id = var.tenancy_ocid
    for_each = var.compartment_var
    compartment_description = each.value.description    
    compartment_name = each.value.compartment_name
    compartment_defined_tags = each.value.compartment_defined_tags
}