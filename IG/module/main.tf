variable "compartment_id" {}
variable "vcn_id" {}
variable "igw_name" {}

resource "oci_core_internet_gateway" "this" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = var.igw_name
  #enabled        = true
}
