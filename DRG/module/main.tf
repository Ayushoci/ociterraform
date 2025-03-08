variable "compartment_id" {
  description = "Compartment OCID where DRG will be created"
  type        = string
}

variable "drg_name" {
  description = "Name of the DRG"
  type        = string
}


resource "oci_core_drg" "this" {
  compartment_id = var.compartment_id
  display_name   = var.drg_name
}
