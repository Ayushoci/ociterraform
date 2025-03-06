variable "compartment_id" {
  description = "The OCID of the compartment"
  type        = string
}

variable "volumes" {
  description = "The OCID of the storage volume to assign the policy"
  type        = list(string)
}

variable "schedules" {
  description = "List of backup schedules"
  type = list(object({
    backup_type         = string
    backup_period       = string
    retention_seconds   = number
    time_schedule_start = string
  }))
}
