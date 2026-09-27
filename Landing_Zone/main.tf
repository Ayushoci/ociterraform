terraform {
  required_version = ">= 1.5.0, < 2.0.0"

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 6.0.0"
    }
  }
}

provider "oci" {
  auth   = "ResourcePrincipal"
  region = var.region
}

module "compartments" {
  source = "./modules/compartments"

  create_compartments    = var.create_compartments
  parent_compartment_id  = var.parent_compartment_id
  compartment_definitions = var.compartment_definitions
  tags                   = var.tags
}

locals {
  network_compartment_id = var.create_compartments ? module.compartments.compartment_ids["network"] : lookup(var.existing_compartment_ids, "network", var.parent_compartment_id)
  compute_compartment_id = var.create_compartments ? module.compartments.compartment_ids["compute"] : lookup(var.existing_compartment_ids, "compute", var.parent_compartment_id)
  storage_compartment_id = var.create_compartments ? module.compartments.compartment_ids["storage"] : lookup(var.existing_compartment_ids, "storage", var.parent_compartment_id)
}

module "network" {
  source = "./modules/network"

  compartment_id = local.network_compartment_id

  vcn_display_name          = var.vcn_display_name
  vcn_dns_label             = var.vcn_dns_label
  vcn_cidr_blocks           = var.vcn_cidr_blocks
  internet_gateway_name     = var.internet_gateway_name
  nat_gateway_name          = var.nat_gateway_name
  public_route_table_name   = var.public_route_table_name
  private_route_table_name  = var.private_route_table_name
  public_security_list_name = var.public_security_list_name
  private_security_list_name = var.private_security_list_name
  public_subnet_name        = var.public_subnet_name
  public_subnet_dns_label   = var.public_subnet_dns_label
  public_subnet_cidr        = var.public_subnet_cidr
  create_private_subnet     = var.create_private_subnet
  private_subnet_name       = var.private_subnet_name
  private_subnet_dns_label  = var.private_subnet_dns_label
  private_subnet_cidr       = var.private_subnet_cidr
  tags                      = var.tags
}

module "compute" {
  source = "./modules/compute"

  create_compute             = var.create_compute
  tenancy_ocid               = var.tenancy_ocid
  compartment_id             = local.compute_compartment_id
  subnet_id                  = var.compute_use_private_subnet && var.create_private_subnet ? module.network.private_subnet_id : module.network.public_subnet_id
  availability_domain_index  = var.availability_domain_index
  instance_display_name      = var.instance_display_name
  shape                      = var.instance_shape
  ocpus                      = var.instance_ocpus
  memory_in_gbs              = var.instance_memory_in_gbs
  assign_public_ip           = var.instance_assign_public_ip
  image_ocid                 = var.instance_image_ocid
  image_operating_system     = var.instance_image_operating_system
  image_operating_system_version = var.instance_image_operating_system_version
  ssh_public_key             = var.instance_ssh_public_key
  tags                       = var.tags
}

module "storage" {
  source = "./modules/storage"

  create_bucket     = var.create_bucket
  compartment_id    = local.storage_compartment_id
  bucket_name       = var.bucket_name
  bucket_access_type = var.bucket_access_type
  storage_tier      = var.bucket_storage_tier
  tags              = var.tags
}

output "effective_compartment_ids" {
  value = {
    network = local.network_compartment_id
    compute = local.compute_compartment_id
    storage = local.storage_compartment_id
  }
}

output "vcn_id" {
  value = module.network.vcn_id
}

output "public_subnet_id" {
  value = module.network.public_subnet_id
}

output "private_subnet_id" {
  value = module.network.private_subnet_id
}

output "instance_id" {
  value = module.compute.instance_id
}

output "bucket_name" {
  value = module.storage.bucket_name
}
