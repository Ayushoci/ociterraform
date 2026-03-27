output "volume_id" {
  description = "OCID of the created block volume"
  value       = oci_core_volume.example.id
}

output "volume_attachment_id" {
  description = "OCID of the created block volume attachment"
  value       = oci_core_volume_attachment.example.id
}
