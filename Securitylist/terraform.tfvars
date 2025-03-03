compartment_id = "ocid1.compartment.oc1..aaaaaaaamgamf64s7adosgyjcix6yd2gwu42gozmpp4snfgzfzmqb4equ5yq"
security_lists_var = {
    "first_sl" = {
        vcn_display_name = "first_vcn"
        display_name = "first_vcn_sl"
        defined_tags = {
        "resource.name"     = "SL"
        }
        ingress_rules = [
            {
            protocol = "6"
            source = "10.0.0.0/8"
            description = "ingress rule"
            source_type = "CIDR_BLOCK"
            tcp_options = {
                max = 111
                min = 111
            }
           },
            {
            protocol = "6"
            source = "10.0.0.0/8"
            description = "ingress rule"
            source_type = "CIDR_BLOCK"
            tcp_options = {
                max = 111
                min = 111
            }
           }
        ]
        egress_rules = [
            {
            protocol = "17"
            destination = "10.0.0.0/8"
            description = "ingress rule"
            destination_type = "CIDR_BLOCK"
            udp_options = {
                max = 111
                min = 111
            }
           },
            {
            protocol = "17"
            destination = "10.0.0.0/8"
            description = "ingress rule"
            destination_type = "CIDR_BLOCK"
            udp_options = {
                max = 111
                min = 111
            }
           }
        ]
    }
    }