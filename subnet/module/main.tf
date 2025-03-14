variable "compartment_id" {}
variable "name" {}
variable "cidr_block" {}
variable "vcn_id" {}
variable "route_table_id" {}
variable "security_list_ids" {
  type = list(string)
}
#variable "dhcp_options_id" {}

variable "prohibit_public_ip_on_vnic" {
  description = "Boolean to prohibit public IP on VNIC"
  type        = bool
}
resource "oci_core_subnet" "this" {
  compartment_id    = var.compartment_id
  vcn_id            = var.vcn_id
  display_name      = var.name
  cidr_block        = var.cidr_block
  route_table_id    = var.route_table_id
  security_list_ids = var.security_list_ids
 # dhcp_options_id   = var.dhcp_options_id
  dns_label         = replace(var.name, "-", "") # OCI requires DNS label to be alphanumeric
  prohibit_public_ip_on_vnic = var.prohibit_public_ip_on_vnic

}
