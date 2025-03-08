variable "internet_gateways" {
  description = "List of Internet Gateways with VCN and compartment details"
  type = list(object({
    igw_name       = string
    compartment_id = string
    vcn_id         = string
  }))
}
