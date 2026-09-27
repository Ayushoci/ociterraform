// Module note:
// Values are passed from root variables. Update root terraform.tfvars, not this file,
// unless you intentionally want to change module defaults.

variable "create_compartments" {
  description = "If true, create child compartments defined in compartment_definitions."
  type        = bool
  default     = false
}

variable "parent_compartment_id" {
  description = "Parent compartment OCID where child compartment can be created."
  type        = string
}

variable "compartment_definitions" {
  description = "Map of child compartments to create. Example keys: network, compute, storage."
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
}

variable "tags" {
  description = "Freeform tags for resources."
  type        = map(string)
  default     = {}
}
