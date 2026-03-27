# Block Volume and Attachment
resource "oci_core_volume" "example" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  display_name        = var.volume_display_name
  size_in_gbs         = var.volume_size_in_gbs
}

resource "oci_core_volume_attachment" "example" {
  attachment_type = "paravirtualized"
  instance_id     = var.instance_id
  volume_id       = oci_core_volume.example.id
}
