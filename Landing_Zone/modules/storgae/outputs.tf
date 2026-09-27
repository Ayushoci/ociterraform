output "bucket_name" {
  value = var.create_bucket ? oci_objectstorage_bucket.this[0].name : null
}

output "bucket_namespace" {
  value = data.oci_objectstorage_namespace.ns.namespace
}
