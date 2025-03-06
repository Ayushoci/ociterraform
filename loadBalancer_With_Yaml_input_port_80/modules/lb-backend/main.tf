variable "load_balancer_id" {
  type = string
}

variable "backendset_name" {
  type = string
}

variable "backend_target_id" {
  type = string
}

variable "backend_port" {
  type = number
}

variable "weight" {
  type    = number
  default = 1
}

# Add this data source to get the actual instance
data "oci_core_instance" "backend_instance" {
  instance_id = var.backend_target_id
}

# Get the primary VNIC for the instance
data "oci_core_vnic_attachments" "instance_vnics" {
  compartment_id = data.oci_core_instance.backend_instance.compartment_id
  instance_id    = var.backend_target_id
}

# Get the primary VNIC's details
data "oci_core_vnic" "instance_vnic" {
  vnic_id = data.oci_core_vnic_attachments.instance_vnics.vnic_attachments[0].vnic_id
}

resource "oci_load_balancer_backend" "this" {
  load_balancer_id = var.load_balancer_id
  backendset_name  = var.backendset_name
  ip_address       = data.oci_core_vnic.instance_vnic.private_ip_address
  port             = var.backend_port
  weight           = var.weight
}