# modules/sgw/main.tf

# Fetch available services
data "oci_core_services" "all_services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}

# Create service gateway
resource "oci_core_service_gateway" "service_gateway" {
  compartment_id = var.compartment_id
  display_name   = var.name
  vcn_id         = var.vcn_id

  services {
    service_id = data.oci_core_services.all_services.services[0].id
  }
}

# Get existing route table using the correct data source
data "oci_core_route_tables" "existing_route_tables" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  
  filter {
    name   = "id"
    values = [var.route_table_id]
  }
}

# Create a new route rule in the existing route table
resource "oci_core_default_route_table" "updated_route_table" {
  manage_default_resource_id = var.route_table_id
  
  # Keep the display name from the existing route table
  display_name = length(data.oci_core_route_tables.existing_route_tables.route_tables) > 0 ? data.oci_core_route_tables.existing_route_tables.route_tables[0].display_name : "${var.name}-route-table"
  
  
  # Copy existing route rules first (if any exist)
dynamic "route_rules" {
  for_each = length(data.oci_core_route_tables.existing_route_tables.route_tables) > 0 ? data.oci_core_route_tables.existing_route_tables.route_tables[0].route_rules : []
  content {
    destination       = route_rules.value.destination
    destination_type  = route_rules.value.destination_type
    network_entity_id = route_rules.value.network_entity_id
    description       = lookup(route_rules.value, "description", null)
  }
}
  
  # Add the new service gateway route rule
  route_rules {
    destination       = data.oci_core_services.all_services.services[0].cidr_block
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = oci_core_service_gateway.service_gateway.id
    description       = "Route to Oracle Services via Service Gateway ${var.name}"
  }
}