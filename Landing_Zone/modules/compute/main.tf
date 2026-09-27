data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

data "oci_core_images" "latest" {
  compartment_id           = var.tenancy_ocid
  operating_system         = var.image_operating_system
  operating_system_version = var.image_operating_system_version
  shape                    = var.shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

locals {
  selected_ad         = data.oci_identity_availability_domains.ads.availability_domains[var.availability_domain_index].name
  selected_image_ocid = length(trimspace(var.image_ocid)) > 0 ? var.image_ocid : data.oci_core_images.latest.images[0].id
}

resource "oci_core_instance" "this" {
  count = var.create_compute ? 1 : 0

  compartment_id      = var.compartment_id
  availability_domain = local.selected_ad
  display_name        = var.instance_display_name
  shape               = var.shape
  freeform_tags       = var.tags

  shape_config {
    ocpus         = var.ocpus
    memory_in_gbs = var.memory_in_gbs
  }

  create_vnic_details {
    subnet_id        = var.subnet_id
    assign_public_ip = var.assign_public_ip
    display_name     = "${var.instance_display_name}-vnic"
  }

  source_details {
    source_type = "image"
    source_id   = local.selected_image_ocid
  }

  metadata = length(trimspace(var.ssh_public_key)) > 0 ? {
    ssh_authorized_keys = var.ssh_public_key
  } : {}
}
