variable "tenancy_ocid" {
    type = string
    default = "ocid1.tenancy.oc1..aaaaaaaap575aefb7krdfcd374xgggeutd4ylwdlhg6f44uajrqzuktz6rcq"
}

variable "compartment_var" {
  type = map(object({
    compartment_name = string
    description = string
    compartment_defined_tags = map(string)
  }))
}