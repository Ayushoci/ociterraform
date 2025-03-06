compartment_id   = "ocid1.compartment.oc1..aaaaaaaape26buh5zkbujozgyrlecuplate5qvmllg3ym3ajotrz4q2q6yzq"
#vcn_id           = "ocid1.vcn.oc1.phx.amaaaaaapxqso7qaq5fij3zcyosyi6d56fheiw2xh4oi5kavvijtvtnkq4za"
#dns_resolver_name = "HUBVCN"

dns_resolver_endpoints = [
  {
    name          = "hub_vcn_listen_new"
    resolver_id = "ocid1.dnsresolver.oc1.iad.amaaaaaavk7qqvaaffwm3d6fxfrgmlq443ghbifs5uehu2duhvbatrdfzroq"
    endpoint_type = "LISTENER"
    subnet_id     = "ocid1.subnet.oc1.iad.aaaaaaaasgjtf4w34ti6j3lk47ikxnaev574cmfqynr6c2skxhoqnc6al3ga"
    listening_address = "172.0.0.3"
  }, 
  {
    name          = "hub_vcn_forward_new"
    resolver_id = "ocid1.dnsresolver.oc1.iad.amaaaaaavk7qqvaaffwm3d6fxfrgmlq443ghbifs5uehu2duhvbatrdfzroq"
    endpoint_type = "FORWARDER"
    subnet_id     = "ocid1.subnet.oc1.iad.aaaaaaaasgjtf4w34ti6j3lk47ikxnaev574cmfqynr6c2skxhoqnc6al3ga"
    forwarding_address = "172.0.0.4"
  },
  {
    name          = "testvcn_forward_new"
    resolver_id   = "ocid1.dnsresolver.oc1.iad.amaaaaaavk7qqvaan4fsfk44gxbawftk6lxm7gtl53l4hl27gth4xjok2gea"
    endpoint_type = "FORWARDER"
    subnet_id     = "ocid1.subnet.oc1.iad.aaaaaaaad7mwkno2vaxlf44bpgac5suqlwgw3i7kkmbrkh4fezemh6gvbzqq"
    forwarding_address = "10.0.0.21"
  },
    {
    name          = "testvcn_listener_new"
    resolver_id = "ocid1.dnsresolver.oc1.iad.amaaaaaavk7qqvaan4fsfk44gxbawftk6lxm7gtl53l4hl27gth4xjok2gea"
    endpoint_type = "LISTENER"
    subnet_id     = "ocid1.subnet.oc1.iad.aaaaaaaad7mwkno2vaxlf44bpgac5suqlwgw3i7kkmbrkh4fezemh6gvbzqq"
    forwarding_address = "10.0.0.22"
  }
]
