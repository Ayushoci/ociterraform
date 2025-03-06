output "backend_set" {
  description = "NLB Backend Set resource"
  value       = oci_network_load_balancer_backend_set.network_load_balancer_backend_set
}

output "id" {
  description = "Backend Set ID"
  value       = oci_network_load_balancer_backend_set.network_load_balancer_backend_set.id
}

output "name" {
  description = "Backend Set name"
  value       = oci_network_load_balancer_backend_set.network_load_balancer_backend_set.name
}