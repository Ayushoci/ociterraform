variable "route_tables" {
  type = list(object({
    name        = string
    compartment_id = string
    vcn_id      = string
    route_rules = list(object({
      network_entity_id = string
      destination       = string
      destination_type  = string
    }))
  }))
}
