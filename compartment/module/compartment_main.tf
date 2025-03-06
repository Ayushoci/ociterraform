variable "compartment_id" {}
variable "compartment_description" {}
variable "compartment_name" {}
variable "compartment_defined_tags" {}

resource "oci_identity_compartment" "compartment" {
	#Resource Compartment
	compartment_id = var.compartment_id
	description = var.compartment_description
	name = var.compartment_name
    defined_tags = var.compartment_defined_tags
}

output "compartment_id" {
    description = "The OCID of the compartment."
    value = oci_identity_compartment.compartment.id
  
}
