variable "compartment_id" {
  description = "Compartment OCID where the NAT Gateway will be created"
  type        = string
}

variable "vcn_id" {
  description = "VCN OCID where the NAT Gateway will be created"
  type        = string
}

variable "nat_name" {
  description = "Name of the NAT Gateway"
  type        = string
}


resource "oci_core_nat_gateway" "this" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = var.nat_name
}
