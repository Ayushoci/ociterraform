resource "oci_core_volume_backup_policy" "backup_policy" {
  compartment_id = var.compartment_id
  display_name   = "StorageBackupPolicy"
  #destination_region  = "us-phoenix-1"

  dynamic "schedules" {
    for_each = var.schedules
    content {
      backup_type         = schedules.value.backup_type
      period              = schedules.value.backup_period
      retention_seconds   = schedules.value.retention_seconds
      time_zone           = "UTC"
      hour_of_day         = 1
 
      #time_schedule_start = schedules.value.time_schedule_start
    }
  }
}


resource "oci_core_volume_backup_policy_assignment" "policy_assignment" {
for_each = toset(var.volumes)

  asset_id  = each.value
  policy_id = oci_core_volume_backup_policy.backup_policy.id
}
