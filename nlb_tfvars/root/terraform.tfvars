network_load_balancer_map = {
  "first-ext-nlb" = {
    display_name                   = "first-ext-nlb"
    is_preserve_source_destination = true
    subnet_id                      = "ocid1.subnet.oc1.eu-frankfurt-1.aaaaaaaadljwjyhxjx3ejt6w5nrzlpp5bun5qyxvv6ccc2zmtn3zcnjnzusq"
    is_private                     = true
    nlb_ip_version                 = "IPV4"
    defined_tags = {
      "TEST_TAGS.CreatedBy" = "DBP"
    }
  }
  "second-ext-nlb" = {
    display_name                   = "second-ext-nlb"
    is_preserve_source_destination = true
    subnet_id                      = "ocid1.subnet.oc1.eu-frankfurt-1.aaaaaaaadljwjyhxjx3ejt6w5nrzlpp5bun5qyxvv6ccc2zmtn3zcnjnzusq"
    is_private                     = true
    nlb_ip_version                 = "IPV4"
    defined_tags = {
      "TEST_TAGS.CreatedBy" = "DBP"
    }
  }
}
network_load_balancer_backend_set_map = {
  "first-nlb-bks" = {
    health_check_protocol      = "TCP"
    health_check_port          = 80
    network_load_balancer_name = "first-ext-nlb"
    display_name               = "first-nlb-bks"
    policy                     = "FIVE_TUPLE"
    is_preserve_source         = true
    ip_version                 = "IPV4"
    interval_in_millis         = "10000"
    retries                    = "3"
    timeout_in_millis          = "5000"
    return_code                = "0"
    response_data              = null
    policy                     = "FIVE_TUPLE"
  }
  "second-nlb-bks" = {
    health_check_protocol      = "TCP"
    health_check_port          = 443
    network_load_balancer_name = "second-ext-nlb"
    display_name               = "second-nlb-bks"
    policy                     = "FIVE_TUPLE"
    is_preserve_source         = true
    ip_version                 = "IPV4"
    interval_in_millis         = "10000"
    retries                    = "3"
    timeout_in_millis          = "5000"
    return_code                = "0"
    response_data              = null
    policy                     = "FIVE_TUPLE"
  }
}
network_load_balancer_backend_map = {
  "backend-1" = {
    backend_set_name           = "first-nlb-bks"
    backend_target_id          = "ocid1.privateip.oc1.eu-frankfurt-1.abtheljsmus234zdi3chjosqtaozsxjgjne2eqko27trgguy6skd6nyg6zra"
    network_load_balancer_name = "first-ext-nlb"
    backend_port               = 443
  }
  "backend-2" = {
    backend_set_name           = "first-nlb-bks"
    backend_target_id          = "ocid1.privateip.oc1.eu-frankfurt-1.abtheljsyq7oe5a7at56crqdpisqd5ek3lk55gjd2e5dzlmgy6dwwfl6tbda"
    network_load_balancer_name = "first-ext-nlb"
    backend_port               = 443
  }
  "backend-3" = {
    backend_set_name           = "second-nlb-bks"
    backend_target_id          = "ocid1.privateip.oc1.eu-frankfurt-1.abtheljsmus234zdi3chjosqtaozsxjgjne2eqko27trgguy6skd6nyg6zra"
    network_load_balancer_name = "second-ext-nlb"
    backend_port               = 0
  }
  "backend-4" = {
    backend_set_name           = "second-nlb-bks"
    backend_target_id          = "ocid1.privateip.oc1.eu-frankfurt-1.abtheljsyq7oe5a7at56crqdpisqd5ek3lk55gjd2e5dzlmgy6dwwfl6tbda"
    network_load_balancer_name = "second-ext-nlb"
    backend_port               = 0
  }
}

network_load_balancer_listener_map = {
  "listener1" = {
    backend_set_name           = "first-nlb-bks"
    network_load_balancer_name = "first-ext-nlb"
    listener_name              = "listener1"
    listener_port              = "443"
    listener_protocol          = "TCP"
    ip_version                 = "IPV4"
  }
  "listener2" = {
    backend_set_name           = "second-nlb-bks"
    network_load_balancer_name = "second-ext-nlb"
    listener_name              = "listener2"
    listener_port              = "0"
    listener_protocol          = "TCP_AND_UDP"
    ip_version                 = "IPV4"
  }
}
