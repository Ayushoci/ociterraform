variable "compartment_id" {
  type    = string
  default = "ocid1.compartment.oc1..aaaaaaaape26buh5zkbujozgyrlecuplate5qvmllg3ym3ajotrz4q2q6yzq"
}

variable "network_load_balancer_map" {
  description = "Map of Load Balancer configurations"
  type = map(object({
    display_name                   = string
    is_preserve_source_destination = bool
    subnet_id                      = string
    is_private                     = bool
    nlb_ip_version                 = string
    defined_tags                   = map(string)
  }))
}

variable "network_load_balancer_backend_set_map" {
  description = "Map of backend set configurations"
  type = map(object({
    health_check_protocol      = string
    health_check_port          = number
    network_load_balancer_name = string
    display_name               = string
    policy                     = string
    is_preserve_source         = bool
    ip_version                 = string
    interval_in_millis         = string
    retries                    = string
    timeout_in_millis          = string
    return_code                = string
    response_data              = string
    #policy                     = string
  }))
}

variable "network_load_balancer_backend_map" {
  description = "Map of backend configurations"
  type = map(object({
    backend_set_name           = string
    backend_target_id          = string
    network_load_balancer_name = string
    backend_port               = number
  }))
}


variable "network_load_balancer_listener_map" {
  description = "Map of listener configuration"
  type = map(object({
    backend_set_name           = string
    network_load_balancer_name = string
    listener_name              = string
    listener_port              = number
    listener_protocol          = string
    ip_version                 = string
  }))

}