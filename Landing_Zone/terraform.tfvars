# MUST UPDATE before first run
# 1) region
# 2) tenancy_ocid
# 3) parent_compartment_id
# 4) instance_ssh_public_key (when create_compute=true)
# 5) bucket_name (must be unique in namespace)

# Mandatory inputs
region               = "ap-mumbai-1"
tenancy_ocid         = "ocid1.tenancy.oc1..replace_with_your_tenancy_ocid"
parent_compartment_id = "ocid1.compartment.oc1..replace_with_your_compartment_ocid"

# Compartment module
create_compartments = true

compartment_definitions = {
  network = {
    name          = "lz-network"
    description   = "Compartment for network resources"
    enable_delete = false
    tags          = {}
  }
  compute = {
    name          = "lz-compute"
    description   = "Compartment for compute resources"
    enable_delete = false
    tags          = {}
  }
  storage = {
    name          = "lz-storage"
    description   = "Compartment for storage resources"
    enable_delete = false
    tags          = {}
  }
}

# If you already have compartments, provide their OCIDs here and set create_compartments=false.
# existing_compartment_ids = {
#   network = "ocid1.compartment.oc1..network"
#   compute = "ocid1.compartment.oc1..compute"
#   storage = "ocid1.compartment.oc1..storage"
# }

# Network module
vcn_display_name            = "lz-vcn"
vcn_dns_label               = "lzvcn"
vcn_cidr_blocks             = ["10.0.0.0/16"]
internet_gateway_name       = "lz-igw"
nat_gateway_name            = "lz-ngw"
public_route_table_name     = "lz-public-rt"
private_route_table_name    = "lz-private-rt"
public_security_list_name   = "lz-public-sl"
private_security_list_name  = "lz-private-sl"
public_subnet_name          = "lz-public-subnet"
public_subnet_dns_label     = "pubsubnet"
public_subnet_cidr          = "10.0.1.0/24"
create_private_subnet       = true
private_subnet_name         = "lz-private-subnet"
private_subnet_dns_label    = "prisubnet"
private_subnet_cidr         = "10.0.2.0/24"

# Compute module
create_compute             = true
compute_use_private_subnet = false
availability_domain_index  = 0
instance_display_name      = "lz-instance"
instance_shape             = "VM.Standard.E4.Flex"
instance_ocpus             = 1
instance_memory_in_gbs     = 8
instance_assign_public_ip  = true
instance_image_ocid        = ""
instance_image_operating_system = "Oracle Linux"
instance_image_operating_system_version = "8"
instance_ssh_public_key    = "ssh-rsa REPLACE_WITH_YOUR_PUBLIC_KEY"

# Storage module
create_bucket       = true
bucket_name         = "lz-state-bucket-change-me-unique"
bucket_access_type  = "NoPublicAccess"
bucket_storage_tier = "Standard"

tags = {
  environment = "landing-zone"
  owner       = "cloud-team"
}
