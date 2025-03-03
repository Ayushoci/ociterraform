variable "compartment_id" {
    type = string
}

variable "security_lists_var" {
    type = map(object({
        vcn_display_name = string
        display_name = string
        defined_tags = map(string)
        ingress_rules = list(object({
            protocol = string
            source = string
            description = optional(string)
            source_type = string
            tcp_options = optional(object({
                max = number
                min = number
                source_port_range = optional(object({
                    max = number
                    min = number
                }))
            }))
            udp_options = optional(object({
                max = number
                min = number
                source_port_range = optional(object({
                    max = number
                    min = number
                }))
            }))
        }))
        egress_rules = list(object({
            protocol = string
            destination = string
            description = optional(string)
            destination_type = string
            tcp_options = optional(object({
                max = number
                min = number
                source_port_range = optional(object({
                    max = number
                    min = number
                }))
            }))
            udp_options = optional(object({
                max = number
                min = number
                source_port_range = optional(object({
                    max = number
                    min = number
                }))
            }))
        }))
     }))
  }