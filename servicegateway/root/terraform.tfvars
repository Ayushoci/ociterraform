# terraform.tfvars

# Provider settings
#tenancy_ocid     = "ocid1.tenancy.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
#user_ocid        = "ocid1.user.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
#fingerprint      = "xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx"
#private_key_path = "~/.oci/oci_api_key.pem"
#region           = "us-ashburn-1"

# Service gateway configurations
service_gateways = [
  {
    name           = "sgw-prod"
    compartment_id = "ocid1.compartment.oc1..aaaaaaaape26buh5zkbujozgyrlecuplate5qvmllg3ym3ajotrz4q2q6yzq"
    vcn_id         = "ocid1.vcn.oc1.eu-frankfurt-1.amaaaaaavk7qqvaar5eyx2q2pijwdk22ia2s7vu45jsdgb7zojd3h5inrpiq"
    route_table_id = "ocid1.routetable.oc1.eu-frankfurt-1.aaaaaaaaynbnmbkvx6gmmdvsdzahuj4hibhc6vv2b574waxxepszczhfrloa"
  }/*,
  {
    name           = "sgw-dev"
    compartment_id = "ocid1.compartment.oc1..aaaaaaaa22222222222222"
    vcn_id         = "ocid1.vcn.oc1.iad.aaaaaaaaa2222222222"
    route_table_id = "ocid1.routetable.oc1.iad.aaaaaaaa222222"
  }*/
]