# modules/sgw/outputs.tf

output "service_gateway_id" {
  description = "The OCID of the created service gateway"
  value       = oci_core_service_gateway.service_gateway.id
}

output "service_gateway_name" {
  description = "The name of the created service gateway"
  value       = oci_core_service_gateway.service_gateway.display_name
}

output "vcn_id" {
  description = "The OCID of the VCN where the service gateway was created"
  value       = var.vcn_id
}

output "route_table_id" {
  description = "The OCID of the route table updated with service gateway route rules"
  value       = oci_core_default_route_table.updated_route_table.id
}

output "subnet_ids" {
  description = "Placeholder for subnet_ids to match the expected output structure"
  value       = []
}