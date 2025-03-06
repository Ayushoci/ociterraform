output "listener" {
  description = "NLB Listener resource"
  value       = oci_network_load_balancer_listener.network_load_balancer_listener
}

output "id" {
  description = "Listener ID"
  value       = oci_network_load_balancer_listener.network_load_balancer_listener.id
}

output "name" {
  description = "Listener name"
  value       = oci_network_load_balancer_listener.network_load_balancer_listener.name
}