variable "subnets" {
  type = list(object({
    name              = string
    cidr_block        = string
    vcn_id            = string
    route_table_id    = string
    security_list_ids = list(string)
 #   dhcp_options_id   = string
    prohibit_public_ip_on_vnic = bool
  }))
}

variable "compartment_id" {
    type = string
}
