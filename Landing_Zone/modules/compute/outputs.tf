output "instance_id" {
  value = var.create_compute ? oci_core_instance.this[0].id : null
}

output "instance_private_ip" {
  value = var.create_compute ? oci_core_instance.this[0].private_ip : null
}

output "instance_public_ip" {
  value = var.create_compute ? oci_core_instance.this[0].public_ip : null
}
