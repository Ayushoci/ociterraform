// Module note:
// Values are passed from root variables. Update root terraform.tfvars, not this file,
// unless you intentionally want to change module defaults.

variable "compartment_id" {
  type = string
}

variable "vcn_display_name" {
  type    = string
  default = "lz-vcn"
}

variable "vcn_dns_label" {
  type    = string
  default = "lzvcn"
}

variable "vcn_cidr_blocks" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "internet_gateway_name" {
  type    = string
  default = "lz-igw"
}

variable "nat_gateway_name" {
  type    = string
  default = "lz-ngw"
}

variable "public_route_table_name" {
  type    = string
  default = "lz-public-rt"
}

variable "private_route_table_name" {
  type    = string
  default = "lz-private-rt"
}

variable "public_security_list_name" {
  type    = string
  default = "lz-public-sl"
}

variable "private_security_list_name" {
  type    = string
  default = "lz-private-sl"
}

variable "public_subnet_name" {
  type    = string
  default = "lz-public-subnet"
}

variable "public_subnet_dns_label" {
  type    = string
  default = "pubsubnet"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "create_private_subnet" {
  type    = bool
  default = true
}

variable "private_subnet_name" {
  type    = string
  default = "lz-private-subnet"
}

variable "private_subnet_dns_label" {
  type    = string
  default = "prisubnet"
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "tags" {
  type    = map(string)
  default = {}
}
