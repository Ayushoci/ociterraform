variable "compartment_id" {
  description = "The OCID of the compartment"
  type        = string
  default     = "ocid1.compartment.oc1..aaaaaaaape26buh5zkbujozgyrlecuplate5qvmllg3ym3ajotrz4q2q6yzq"
}

variable "hub_compartment_id" {
  description = "The OCID of the compartment"
  type        = string
  default     = "ocid1.compartment.oc1..aaaaaaaape26buh5zkbujozgyrlecuplate5qvmllg3ym3ajotrz4q2q6yzq"
}


variable "databases" {
  description = "Configuration for each database"
  type        = map(object({
    db_system_availability_domain = string
    db_system_db_home_database_admin_password = string
    cpu_core_count = number
    display_name = string
    hostname = string
    db_system_data_storage_percentage = number
    db_system_data_storage_size_in_gb = number
    db_system_node_count = number
    db_system_display_name = string
    db_system_db_home_database_db_name = string
    db_unique_name = string
    db_system_db_home_database_pdb_name = string
    domain = string
    db_version = string
    subnet_name = string
    ssh_public_keys = list(string)
    defined_tags = map(string)
    tde_wallet_password = string
    cluster_name = optional(string)
    kms_key_id = optional(string)
    kms_key_version_id = optional(string)
    nsg_ids = optional(list(string))
    private_ip = optional(string)
    database_software_image_id = optional(string)
    sparse_diskgroup = optional(bool)
    database_id = optional(string)
    db_domain = optional(string)
    time_stamp_for_point_in_time_recovery = optional(string)
    vault_id = optional(string)
  }))
}