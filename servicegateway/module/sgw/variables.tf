# modules/sgw/variables.tf

variable "compartment_id" {
  description = "The OCID of the compartment where the service gateway will be created"
  type        = string
}

variable "name" {
  description = "The name of the service gateway"
  type        = string
}

variable "vcn_id" {
  description = "The OCID of the VCN where the service gateway will be created"
  type        = string
}

variable "route_table_id" {
  description = "The OCID of the existing route table to update with service gateway route rules"
  type        = string
}