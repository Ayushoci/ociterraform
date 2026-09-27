resource "oci_core_vcn" "this" {
  compartment_id = var.compartment_id
  display_name   = var.vcn_display_name
  dns_label      = var.vcn_dns_label
  cidr_blocks    = var.vcn_cidr_blocks
  freeform_tags  = var.tags
}

resource "oci_core_internet_gateway" "this" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.this.id
  display_name   = var.internet_gateway_name
  enabled        = true
  freeform_tags  = var.tags
}

resource "oci_core_nat_gateway" "this" {
  count = var.create_private_subnet ? 1 : 0

  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.this.id
  display_name   = var.nat_gateway_name
  freeform_tags  = var.tags
}

resource "oci_core_route_table" "public" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.this.id
  display_name   = var.public_route_table_name
  freeform_tags  = var.tags

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.this.id
  }
}

resource "oci_core_route_table" "private" {
  count = var.create_private_subnet ? 1 : 0

  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.this.id
  display_name   = var.private_route_table_name
  freeform_tags  = var.tags

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.this[0].id
  }
}

resource "oci_core_security_list" "public" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.this.id
  display_name   = var.public_security_list_name
  freeform_tags  = var.tags

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 80
      max = 80
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 443
      max = 443
    }
  }

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}

resource "oci_core_security_list" "private" {
  count = var.create_private_subnet ? 1 : 0

  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.this.id
  display_name   = var.private_security_list_name
  freeform_tags  = var.tags

  ingress_security_rules {
    protocol = "all"
    source   = var.vcn_cidr_blocks[0]
  }

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}

resource "oci_core_subnet" "public" {
  compartment_id             = var.compartment_id
  vcn_id                     = oci_core_vcn.this.id
  cidr_block                 = var.public_subnet_cidr
  display_name               = var.public_subnet_name
  dns_label                  = var.public_subnet_dns_label
  route_table_id             = oci_core_route_table.public.id
  security_list_ids          = [oci_core_security_list.public.id]
  prohibit_public_ip_on_vnic = false
  freeform_tags              = var.tags
}

resource "oci_core_subnet" "private" {
  count = var.create_private_subnet ? 1 : 0

  compartment_id             = var.compartment_id
  vcn_id                     = oci_core_vcn.this.id
  cidr_block                 = var.private_subnet_cidr
  display_name               = var.private_subnet_name
  dns_label                  = var.private_subnet_dns_label
  route_table_id             = oci_core_route_table.private[0].id
  security_list_ids          = [oci_core_security_list.private[0].id]
  prohibit_public_ip_on_vnic = true
  freeform_tags              = var.tags
}
