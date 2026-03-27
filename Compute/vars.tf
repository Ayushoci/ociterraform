# Compute Instance Variables
variable "availability_domain" {
  description = "The availability domain to launch the instance in"
}

variable "instance_shape" {
  description = "The shape of the compute instance"
}

variable "instance_display_name" {
  description = "Display name for the compute instance"
}

variable "instance_image_id" {
  description = "OCID of the image to use for the instance"
}

variable "ssh_public_key" {
  description = "SSH public key for instance access"
}



variable "compartment_id" {
  description = "The Compartment ID of the Instance"
}
