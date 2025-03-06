variable "db_system_availability_domain" {}
variable "compartment_id" {}
variable "hub_compartment_id" {}
variable "db_system_db_home_database_admin_password" {}
variable "cpu_core_count" {}
variable "display_name" {}
variable "hostname" {}
variable "db_system_data_storage_percentage" {}
variable "db_system_data_storage_size_in_gb" {}
variable "db_system_node_count" {}
variable "db_system_display_name" {}
variable "db_system_db_home_database_db_name" {}
variable "db_unique_name" {}
variable "db_system_db_home_database_pdb_name" {}
variable "cluster_name" {}
variable "kms_key_id" {}
variable "kms_key_version_id" {}
variable "nsg_ids" {}
variable "private_ip" {}
variable "database_software_image_id" {}
variable "sparse_diskgroup" {}
variable "database_id" {}
variable "db_domain" {}
variable "time_stamp_for_point_in_time_recovery" {}
variable "vault_id" {}
variable "domain" {}
variable "tde_wallet_password" {}
variable "db_version" {}
variable "subnet_name" {}
variable "defined_tags" {}
variable "ssh_public_keys" {}
data "oci_core_subnets" "subnets" {
  compartment_id = var.hub_compartment_id
}

locals {
  subnet_id = [for s in data.oci_core_subnets.subnets.subnets : s.id if s.display_name == var.subnet_name][0]
}

resource "oci_database_db_system" "testdbsystem" {
  availability_domain     = var.db_system_availability_domain
  cluster_name            = var.cluster_name
  compartment_id          = var.compartment_id
  cpu_core_count          = var.cpu_core_count
  data_storage_percentage = var.db_system_data_storage_percentage
  data_storage_size_in_gb = var.db_system_data_storage_size_in_gb
  database_edition        = "ENTERPRISE_EDITION"
  defined_tags = var.defined_tags
  disk_redundancy                 = "HIGH"
  display_name                    = var.display_name
  domain                          = var.domain
  fault_domains                   = ["FAULT-DOMAIN-1"]
  hostname                        = var.hostname
  kms_key_id                      = var.kms_key_id
  kms_key_version_id              = var.kms_key_version_id
  license_model                   = "BRING_YOUR_OWN_LICENSE"
  node_count                      = var.db_system_node_count
  nsg_ids                         = var.nsg_ids
  private_ip                      = var.private_ip
  shape                           = "VM.Standard.E5.Flex"
  source                          = "NONE"
  source_db_system_id             = var.database_software_image_id
  sparse_diskgroup                = var.sparse_diskgroup
  ssh_public_keys                 = var.ssh_public_keys
  storage_volume_performance_mode = "HIGH_PERFORMANCE"
  subnet_id                       = local.subnet_id
  time_zone                       = "UTC"
  data_collection_options {
    is_diagnostics_events_enabled = true
    is_health_monitoring_enabled  = false
    is_incident_logs_enabled      = true
  }
  db_home {
    create_async               = false
    database_software_image_id = var.database_software_image_id
    db_version                 = var.db_version
    defined_tags               = var.defined_tags
    display_name               = var.db_system_display_name
    database {
      admin_password             = var.db_system_db_home_database_admin_password # sensitive
      character_set              = "AL32UTF8"
      database_id                = var.database_id
      database_software_image_id = var.database_software_image_id
      db_domain                  = var.db_domain
      db_name                    = var.db_system_db_home_database_db_name
      db_unique_name             = var.db_unique_name
      db_workload                = "OLTP"
      defined_tags = var.defined_tags
      kms_key_id                            = var.kms_key_id
      kms_key_version_id                    = var.kms_key_version_id
      ncharacter_set                        = "AL16UTF16"
      pdb_name                              = var.db_system_db_home_database_pdb_name
      pluggable_databases                   = []
      tde_wallet_password                   = var.tde_wallet_password # sensitive
      time_stamp_for_point_in_time_recovery = var.time_stamp_for_point_in_time_recovery
      vault_id                              = var.vault_id
      db_backup_config {
        auto_backup_enabled       = false
      }
    }
  }
  db_system_options {
    storage_management = "ASM"
  }
}
