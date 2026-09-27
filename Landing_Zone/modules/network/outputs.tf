output "vcn_id" {
  value = oci_core_vcn.this.id
}

output "public_subnet_id" {
  value = oci_core_subnet.public.id
}

output "private_subnet_id" {
  value = var.create_private_subnet ? oci_core_subnet.private[0].id : null
}

output "internet_gateway_id" {
  value = oci_core_internet_gateway.this.id
}

output "nat_gateway_id" {
  value = var.create_private_subnet ? oci_core_nat_gateway.this[0].id : null
}
