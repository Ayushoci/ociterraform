output "network_load_balancer" {
  description = "Network Load Balancer resource"
  value       = oci_network_load_balancer_network_load_balancer.network_load_balancer
}

output "id" {
  description = "Network Load Balancer ID"
  value       = oci_network_load_balancer_network_load_balancer.network_load_balancer.id
}

output "display_name" {
  description = "Network Load Balancer display name"
  value       = oci_network_load_balancer_network_load_balancer.network_load_balancer.display_name
}

output "ip_addresses" {
  description = "Network Load Balancer IP addresses"
  value       = oci_network_load_balancer_network_load_balancer.network_load_balancer.ip_addresses
}