route_tables = [
  {
    name           = "rt-igw"
    compartment_id = "ocid1.compartment.oc1..aaaaaaaamgamf64s7adosgyjcix6yd2gwu42gozmpp4snfgzfzmqb4equ5yq"
    vcn_id         = "ocid1.vcn.oc1.phx.amaaaaaapxqso7qaq5fij3zcyosyi6d56fheiw2xh4oi5kavvijtvtnkq4za"
    route_rules = [
      {
        network_entity_id = "ocid1.internetgateway.oc1.phx.aaaaaaaarp25vmdkzr6vhknw5arjeesbd7x42klqkzxgkc72f26czr53jfrq"
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
      },
      {
        network_entity_id = "ocid1.drg.oc1.phx.aaaaaaaa3gqp2han5kj3vwe54l7ires25avogd45u6jhe3ffmf3smgycm2ta"
        destination       = "192.168.0.0/16"
        destination_type  = "CIDR_BLOCK"
      }
    ]
  },
  {
    name           = "rt-nat"
    compartment_id = "ocid1.compartment.oc1..aaaaaaaamgamf64s7adosgyjcix6yd2gwu42gozmpp4snfgzfzmqb4equ5yq"
    vcn_id         = "ocid1.vcn.oc1.phx.amaaaaaapxqso7qaq5fij3zcyosyi6d56fheiw2xh4oi5kavvijtvtnkq4za"
    route_rules = [
      {
        network_entity_id = "ocid1.natgateway.oc1.phx.aaaaaaaaybvniismlirv5y422kmwoo7oizm5givo3j63cprddprpl2v4pqna"
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
      }
    ]
  },
  {
    name           = "rt-sgw"
    compartment_id = "ocid1.compartment.oc1..aaaaaaaamgamf64s7adosgyjcix6yd2gwu42gozmpp4snfgzfzmqb4equ5yq"
    vcn_id         = "ocid1.vcn.oc1.phx.amaaaaaapxqso7qaq5fij3zcyosyi6d56fheiw2xh4oi5kavvijtvtnkq4za"
    route_rules = [
      {
        network_entity_id = "ocid1.servicegateway.oc1.phx.aaaaaaaatbixsickbnd2tcuvvisgjqfbhcg5gogamqrbiwbghxmxa34kh3cq"
        destination       = "all-phx-services-in-oracle-services-network"
        destination_type  = "SERVICE_CIDR_BLOCK"
      }
    ]
  }
]
