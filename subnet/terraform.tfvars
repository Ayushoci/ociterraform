compartment_id = "ocid1.compartment.oc1..aaaaaaaajinvk2hpcearkgcxiiklv42mx2vg2i6yenr6hvolupsyw43awyka"

subnets = [
  {
    name                      = "subnet-private-1"
    cidr_block                = "11.0.3.0/24"
    vcn_id                    = "ocid1.vcn.oc1.phx.amaaaaaapxqso7qaq5fij3zcyosyi6d56fheiw2xh4oi5kavvijtvtnkq4za"
    route_table_id            = "ocid1.routetable.oc1.phx.aaaaaaaaf2q77kpsmplgqjmqxoh6lsa7jhkdslc5blat6dxbzedggag5ycqq"
    security_list_ids         = ["ocid1.securitylist.oc1.phx.aaaaaaaanlqyfv6cblnxeuze7revpabvkcyuxrnsr73v65hxfqlseefjxjwa"]
 #   dhcp_options_id           = "ocid1.dhcpoptions.oc1.phx.xxxxx"
    prohibit_public_ip_on_vnic = true   # Private Subnet
  },
  {
    name                      = "subnet-private-2"
    cidr_block                = "11.0.4.0/24"
    vcn_id                    = "ocid1.vcn.oc1.phx.amaaaaaapxqso7qaq5fij3zcyosyi6d56fheiw2xh4oi5kavvijtvtnkq4za"
    route_table_id            = "ocid1.routetable.oc1.phx.aaaaaaaaj7md4tgz4mmyxmw3ydtrwax2nd3dohm66d4oerjwppc3mcgtodqa"
    security_list_ids         = ["ocid1.securitylist.oc1.phx.aaaaaaaanlqyfv6cblnxeuze7revpabvkcyuxrnsr73v65hxfqlseefjxjwa"]
 #   dhcp_options_id           = "ocid1.dhcpoptions.oc1.phx.yyyyy"
    prohibit_public_ip_on_vnic = true   # Private Subnet
  },
  {
    name                      = "subnet-public-1"
    cidr_block                = "11.0.5.0/24"
    vcn_id                    = "ocid1.vcn.oc1.phx.amaaaaaapxqso7qaq5fij3zcyosyi6d56fheiw2xh4oi5kavvijtvtnkq4za"
    route_table_id            = "ocid1.routetable.oc1.phx.aaaaaaaahx2kjfsryun4dubjzfa2lddwtti5rr6fogxwny45qstgyu4vopua"
    security_list_ids         = ["ocid1.securitylist.oc1.phx.aaaaaaaanlqyfv6cblnxeuze7revpabvkcyuxrnsr73v65hxfqlseefjxjwa"]
   # dhcp_options_id           = "ocid1.dhcpoptions.oc1.phx.zzzzz"
    prohibit_public_ip_on_vnic = false  # Public Subnet
  }
]
