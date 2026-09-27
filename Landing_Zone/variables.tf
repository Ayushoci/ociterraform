// IMPORTANT:
// Update required values in terraform.tfvars before running this stack.
// Required at minimum: region, tenancy_ocid, parent_compartment_id,
// instance_ssh_public_key (when create_compute=true), and unique bucket_name.

// Required core inputs (no defaults).
variable "region" {
  description = "OCI region where resources will be created."
  type        = string
}

variable "tenancy_ocid" {
  description = "Tenancy OCID required for Availability Domain lookup in compute module."
  type        = string
}

variable "create_compartments" {
  description = "If true, create child compartments from compartment_definitions."
  type        = bool
  default     = true
}

variable "parent_compartment_id" {
  description = "Parent compartment OCID where resources are created (or where child compartment is created)."
  type        = string
}

// Optional compartment behavior.
variable "compartment_definitions" {
  description = "Compartments to create. Recommended keys: network, compute, storage."
  type = map(object({
    name          = string
    description   = string
    enable_delete = optional(bool, false)
    tags          = optional(map(string), {})
  }))
  default = {
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

  validation {
    condition     = contains(keys(var.compartment_definitions), "network") && contains(keys(var.compartment_definitions), "compute") && contains(keys(var.compartment_definitions), "storage")
    error_message = "compartment_definitions must include network, compute, and storage keys."
  }
}

variable "existing_compartment_ids" {
  description = "Optional existing compartment OCIDs by key (network/compute/storage). Takes precedence over created ones."
  type        = map(string)
  default     = {}
}

// Optional network customization.
variable "vcn_display_name" {
  description = "VCN display name."
  type        = string
  default     = "lz-vcn"
}

variable "vcn_dns_label" {
  description = "VCN DNS label."
  type        = string
  default     = "lzvcn"
}

variable "vcn_cidr_blocks" {
  description = "VCN CIDR blocks."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "internet_gateway_name" {
  description = "Internet Gateway name."
  type        = string
  default     = "lz-igw"
}

variable "nat_gateway_name" {
  description = "NAT Gateway name."
  type        = string
  default     = "lz-ngw"
}

variable "public_route_table_name" {
  description = "Public route table name."
  type        = string
  default     = "lz-public-rt"
}

variable "private_route_table_name" {
  description = "Private route table name."
  type        = string
  default     = "lz-private-rt"
}

variable "public_security_list_name" {
  description = "Public security list name."
  type        = string
  default     = "lz-public-sl"
}

variable "private_security_list_name" {
  description = "Private security list name."
  type        = string
  default     = "lz-private-sl"
}

variable "public_subnet_name" {
  description = "Public subnet name."
  type        = string
  default     = "lz-public-subnet"
}

variable "public_subnet_dns_label" {
  description = "Public subnet DNS label."
  type        = string
  default     = "pubsubnet"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR."
  type        = string
  default     = "10.0.1.0/24"
}

variable "create_private_subnet" {
  description = "If true, create a private subnet and NAT gateway."
  type        = bool
  default     = true
}

variable "private_subnet_name" {
  description = "Private subnet name."
  type        = string
  default     = "lz-private-subnet"
}

variable "private_subnet_dns_label" {
  description = "Private subnet DNS label."
  type        = string
  default     = "prisubnet"
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR."
  type        = string
  default     = "10.0.2.0/24"
}

// Optional compute customization.
variable "create_compute" {
  description = "If true, create one compute instance."
  type        = bool
  default     = false
}

variable "compute_use_private_subnet" {
  description = "If true, place compute in private subnet, otherwise in public subnet."
  type        = bool
  default     = false
}

variable "availability_domain_index" {
  description = "Availability Domain index for the instance."
  type        = number
  default     = 0
}

variable "instance_display_name" {
  description = "Compute instance display name."
  type        = string
  default     = "lz-instance"
}

variable "instance_shape" {
  description = "Compute instance shape."
  type        = string
  default     = "VM.Standard.E4.Flex"
}

variable "instance_ocpus" {
  description = "OCPUs for flexible shape."
  type        = number
  default     = 1
}

variable "instance_memory_in_gbs" {
  description = "Memory in GB for flexible shape."
  type        = number
  default     = 8
}

variable "instance_assign_public_ip" {
  description = "Assign public IP to compute VNIC."
  type        = bool
  default     = true
}

variable "instance_image_ocid" {
  description = "Image OCID for compute instance."
  type        = string
  default     = ""
}

variable "instance_image_operating_system" {
  description = "Operating system used for automatic image selection when instance_image_ocid is empty."
  type        = string
  default     = "Oracle Linux"
}

variable "instance_image_operating_system_version" {
  description = "Operating system version used for automatic image selection when instance_image_ocid is empty."
  type        = string
  default     = "8"
}

variable "instance_ssh_public_key" {
  description = "SSH public key for compute metadata."
  type        = string
  default     = ""
}

// Optional storage customization.
variable "create_bucket" {
  description = "If true, create Object Storage bucket."
  type        = bool
  default     = true
}

variable "bucket_name" {
  description = "Object Storage bucket name (must be unique in namespace)."
  type        = string
  default     = "lz-state-bucket"
}

variable "bucket_access_type" {
  description = "Bucket access type."
  type        = string
  default     = "NoPublicAccess"
}

variable "bucket_storage_tier" {
  description = "Bucket storage tier."
  type        = string
  default     = "Standard"
}

variable "tags" {
  description = "Freeform tags for all resources."
  type        = map(string)
  default = {
    environment = "landing-zone"
    managed_by  = "terraform"
  }
}
