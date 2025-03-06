module "private_dns_resolver" {
  source               = "../modules"
  compartment_id       = var.compartment_id
  #vcn_id               = var.vcn_id
  #dns_resolver_name    = var.dns_resolver_name
  dns_resolver_endpoints = var.dns_resolver_endpoints
}
