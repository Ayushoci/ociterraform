output "backend" {
  description = "NLB Backend resource"
  value       = oci_network_load_balancer_backend.network_load_balancer_backend
}

output "id" {
  description = "Backend ID"
  value       = oci_network_load_balancer_backend.network_load_balancer_backend.id
}

output "name" {
  description = "Backend name"
  value       = oci_network_load_balancer_backend.network_load_balancer_backend.name
}