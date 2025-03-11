# variables.tf

# # Provider variables
# variable "tenancy_ocid" {
#   description = "The OCID of the tenancy"
#   type        = string
# }

# variable "user_ocid" {
#   description = "The OCID of the user"
#   type        = string
# }

# variable "fingerprint" {
#   description = "The fingerprint of the API key"
#   type        = string
# }

# variable "private_key_path" {
#   description = "The path to the private key file"
#   type        = string
# }

# variable "region" {
#   description = "The OCI region"
#   type        = string
# }

# Service Gateway configurations
variable "service_gateways" {
  description = "List of service gateways to create with their configurations"
  type = list(object({
    name           = string
    compartment_id = string
    vcn_id         = string
    route_table_id = string
  }))
}