variable "compartment_id" {
  description = "The OCID of the compartment"
  type        = string
}

/* variable "vcn_id" {
  description = "The OCID of the VCN where the resolver will be created"
  type        = string
} */

# variable "dns_resolver_name" {
#   description = "The name of the private DNS resolver"
#   type        = string
# }

variable "dns_resolver_endpoints" {
  description = "List of private DNS resolver endpoints"
  type = list(object({
    name            = string
    endpoint_type   = string  # Possible values: LISTENER or FORWARDER
    subnet_id       = string
    resolver_id     = string
    forwarding_address = optional(string)  # Only for FORWARDER
    listening_address = optional(string)   # Only for LISTENER
  }))
}
