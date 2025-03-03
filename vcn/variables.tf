
variable "vcn_var" {
    type = map(object({
        compartment_id = string
        vcn_cidr_block  = string
        vcn_display_name    = string
        vcn_dns_label       = string
        vcn_defined_tags    = map(string)
    }))
}