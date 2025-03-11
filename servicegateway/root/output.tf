# outputs.tf

output "service_gateway_details" {
  description = "Details of all created service gateways"
  value = {
    for name, sgw in module.service_gateways : name => {
      id         = sgw.service_gateway_id
      name       = sgw.service_gateway_name
      vcn_id     = sgw.vcn_id
      subnet_ids = sgw.subnet_ids
    }
  }
}