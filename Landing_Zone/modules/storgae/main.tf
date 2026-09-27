data "oci_objectstorage_namespace" "ns" {
  compartment_id = var.compartment_id
}

resource "oci_objectstorage_bucket" "this" {
  count = var.create_bucket ? 1 : 0

  compartment_id = var.compartment_id
  namespace      = data.oci_objectstorage_namespace.ns.namespace
  name           = var.bucket_name
  access_type    = var.bucket_access_type
  storage_tier   = var.storage_tier

  freeform_tags = var.tags
}
