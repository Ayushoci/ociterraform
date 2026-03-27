# Compute and Network Resources
resource "oci_core_vcn" "hub_vcn" {
  compartment_id = var.compartment_id
  cidr_block     = "10.0.0.0/16"
  display_name   = "hub-vcn"
  dns_label      = "hubvcn"
}

resource "oci_core_subnet" "public_subnet" {
  compartment_id      = var.compartment_id
  vcn_id              = oci_core_vcn.hub_vcn.id
  cidr_block          = "10.0.1.0/24"
  display_name        = "public-subnet"
  dns_label           = "publicdns"
  prohibit_public_ip_on_vnic = false
}

resource "oci_core_subnet" "private_subnet" {
  compartment_id      = var.compartment_id
  vcn_id              = oci_core_vcn.hub_vcn.id
  cidr_block          = "10.0.2.0/24"
  display_name        = "private-subnet"
  dns_label           = "privatedns"
  prohibit_public_ip_on_vnic = true
}

resource "oci_core_instance" "example" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  shape               = var.instance_shape
  display_name        = var.instance_display_name

  shape_config {
    ocpus         = 1
    memory_in_gbs = 16
  }

  source_details {
    source_type = "image"
    source_id   = var.instance_image_id
  }

  create_vnic_details {
    assign_public_ip = true
    display_name     = "example-vnic"
    hostname_label   = "examplehost"
    subnet_id        = oci_core_subnet.public_subnet.id
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
}
