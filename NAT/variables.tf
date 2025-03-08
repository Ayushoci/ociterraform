variable "nat_gateways" {
  description = "List of NAT Gateways"
  type = list(object({
    nat_name       = string
    compartment_id = string
    vcn_id         = string
  }))
}
