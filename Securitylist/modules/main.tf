variable "compartment_id" {}
variable "security_lists" {}

data "oci_core_vcns" "vcns" {
    compartment_id = var.compartment_id
}

locals {
    vcn_id = {for vcn in data.oci_core_vcns.vcns.virtual_networks : vcn.display_name => vcn.id}
    }
resource "oci_core_security_list" "security_list" {
    for_each = var.security_lists
    compartment_id = var.compartment_id
    vcn_id = local.vcn_id[each.value.vcn_display_name]
    display_name = each.value.display_name
    defined_tags = each.value.defined_tags
    
    dynamic "ingress_security_rules" {
     for_each = each.value.ingress_rules
        content {
        protocol = ingress_security_rules.value.protocol
        source = ingress_security_rules.value.source
        description = ingress_security_rules.value.description
        source_type = ingress_security_rules.value.source_type

            dynamic "tcp_options" {
                for_each = lookup(ingress_security_rules.value, "tcp_options", null) != null ? [1] : []
                content {
                    max = ingress_security_rules.value.tcp_options.max
                    min = ingress_security_rules.value.tcp_options.min
                
                dynamic "source_port_range" {
                    for_each = ingress_security_rules.value.tcp_options.source_port_range != null ? [1] : []
                    content {
                        max = ingress_security_rules.value.tcp_options.source_port_range.max
                        min = ingress_security_rules.value.tcp_options.source_port_range.min
                    }
                }
            }
        }
    dynamic "udp_options" {
                for_each = lookup(ingress_security_rules.value, "udp_options", null) != null ? [1] : []
                content {
                    max = ingress_security_rules.value.udp_options.max
                    min = ingress_security_rules.value.udp_options.min
                
                dynamic "source_port_range" {
                    for_each = ingress_security_rules.value.udp_options.source_port_range != null ? [1] : []
                    content {
                        max = ingress_security_rules.value.udp_options.source_port_range.max
                        min = ingress_security_rules.value.udp_options.source_port_range.min
                    }
                }
            }
        }
     }
}
dynamic "egress_security_rules" {
     for_each = each.value.egress_rules
        content {
        protocol = egress_security_rules.value.protocol
        destination = egress_security_rules.value.destination
        description = egress_security_rules.value.description
        destination_type = egress_security_rules.value.destination_type

            dynamic "tcp_options" {
                for_each = lookup(egress_security_rules.value, "tcp_options", null) != null ? [1] : []
                content {
                    max = egress_security_rules.value.tcp_options.max
                    min = egress_security_rules.value.tcp_options.min
                
                dynamic "source_port_range" {
                    for_each = egress_security_rules.value.tcp_options.source_port_range != null ? [1] : []
                    content {
                        max = egress_security_rules.value.tcp_options.source_port_range.max
                        min = egress_security_rules.value.tcp_options.source_port_range.min
                    }
                }
            }
        }
    dynamic "udp_options" {
                for_each = lookup(egress_security_rules.value, "udp_options", null) != null ? [1] : []
                content {
                    max = egress_security_rules.value.udp_options.max
                    min = egress_security_rules.value.udp_options.min
                
                dynamic "source_port_range" {
                    for_each = egress_security_rules.value.udp_options.source_port_range != null ? [1] : []
                    content {
                        max = egress_security_rules.value.udp_options.source_port_range.max
                        min = egress_security_rules.value.udp_options.source_port_range.min
                    }
                }
            }
        }
     }
  }
}