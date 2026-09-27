resource "oci_identity_compartment" "this" {
  for_each = var.create_compartments ? var.compartment_definitions : {}

  compartment_id = var.parent_compartment_id
  name           = each.value.name
  description    = each.value.description
  enable_delete  = each.value.enable_delete

  freeform_tags = merge(var.tags, each.value.tags)
}
