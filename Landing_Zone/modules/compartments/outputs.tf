output "compartment_ids" {
  description = "Map of created compartment ids keyed by compartment_definitions keys."
  value       = { for key, comp in oci_identity_compartment.this : key => comp.id }
}
