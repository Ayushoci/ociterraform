variable "drgs" {
  description = "List of DRGs with compartment and name"
  type = list(object({
    drg_name       = string
    compartment_id = string
  }))
}
