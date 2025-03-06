module "backup_policy" {
  source         = "./modules"
  compartment_id = var.compartment_id
  volumes      = var.volumes
  schedules      = var.schedules
}
