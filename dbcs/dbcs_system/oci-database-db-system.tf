module "db_system" {
    source = "../modules"
    compartment_id = var.compartment_id
    hub_compartment_id = var.hub_compartment_id

    for_each = var.databases
    db_system_availability_domain = each.value.db_system_availability_domain
    db_system_db_home_database_admin_password = each.value.db_system_db_home_database_admin_password
    cpu_core_count = each.value.cpu_core_count
    display_name = each.value.display_name
    hostname = each.value.hostname
    db_system_data_storage_percentage = each.value.db_system_data_storage_percentage
    db_system_data_storage_size_in_gb = each.value.db_system_data_storage_size_in_gb
    db_system_node_count = each.value.db_system_node_count
    db_system_display_name = each.value.db_system_display_name
    db_system_db_home_database_db_name = each.value.db_system_db_home_database_db_name
    db_unique_name = each.value.db_unique_name
    db_system_db_home_database_pdb_name = each.value.db_system_db_home_database_pdb_name
    cluster_name = each.value.cluster_name
    kms_key_id = each.value.kms_key_id
    kms_key_version_id = each.value.kms_key_version_id
    nsg_ids = each.value.nsg_ids
    private_ip = each.value.private_ip
    database_software_image_id = each.value.database_software_image_id
    sparse_diskgroup = each.value.sparse_diskgroup
    database_id = each.value.database_id
    db_domain = each.value.db_domain
    time_stamp_for_point_in_time_recovery = each.value.time_stamp_for_point_in_time_recovery
    vault_id = each.value.vault_id
    domain = each.value.domain
    tde_wallet_password = each.value.tde_wallet_password
    db_version = each.value.db_version
    subnet_name = each.value.subnet_name
    defined_tags = each.value.defined_tags
    ssh_public_keys = each.value.ssh_public_keys
    // ... use all other properties here
}