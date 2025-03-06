#variable "tenancy_ocid" { type = string }
variable "compartment_id" { type = string }
#variable "region" { type = string }

variable "display_name" { type = string }
variable "shape" { type = string }
variable "subnet_ids" { type = list(string) }
variable "defined_tags" { type = map(string) }
variable "is_private" { type = bool }
variable "minimum_bandwidth_in_mbps" { type = number }
variable "maximum_bandwidth_in_mbps" { type = number }

resource "oci_load_balancer_load_balancer" "this" {
  compartment_id = var.compartment_id
  display_name = var.display_name
  shape = var.shape
  subnet_ids = var.subnet_ids
  defined_tags = var.defined_tags
  is_private = var.is_private
  
  shape_details {
    minimum_bandwidth_in_mbps = var.minimum_bandwidth_in_mbps
    maximum_bandwidth_in_mbps = var.maximum_bandwidth_in_mbps
  }
}

output "load_balancer_id" {
  value = oci_load_balancer_load_balancer.this.id
}
