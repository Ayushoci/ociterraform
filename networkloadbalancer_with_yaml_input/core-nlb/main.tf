# Create network load balancer
module "network_load_balancer" {
  source                       = "../modules/nlb"
  for_each                     = { for nlb in local.nlb_yaml.network_load_balancer_map : nlb.display_name => nlb }
  compartment_id               = local.nlb_yaml.compartment_id
  display_name                 = each.value.display_name
  subnet_id                    = each.value.subnet_id
  is_preserve_source_destination = each.value.is_preserve_source_destination
  is_private                   = each.value.is_private
  nlb_ip_version               = each.value.nlb_ip_version
  defined_tags                 = each.value.defined_tags
}

# Create network load balancer backend sets
module "network_load_balancer_backend_set" {
  source                     = "../modules/nlb-backend-set"
  for_each                   = { for bs in local.nlb_yaml.network_load_balancer_backend_set_map : bs.display_name => bs }
  display_name               = each.value.display_name
  network_load_balancer_id   = module.network_load_balancer[each.value.network_load_balancer_name].id
  health_check_protocol      = each.value.health_check_protocol
  health_check_port          = each.value.health_check_port
  policy                     = each.value.policy
  is_preserve_source         = each.value.is_preserve_source
  ip_version                 = each.value.ip_version
  interval_in_millis         = each.value.interval_in_millis
  retries                    = each.value.retries
  timeout_in_millis          = each.value.timeout_in_millis
  return_code                = each.value.return_code
  response_data              = each.value.response_data
}

# Create network load balancer backends
module "network_load_balancer_backend" {
  source                     = "../modules/nlb-backend"
  for_each                   = { for backend in local.nlb_yaml.network_load_balancer_backend_map : 
                                "${backend.network_load_balancer_name}-${backend.backend_set_name}-${backend.backend_port}-${backend.backend_target_id}" => backend }
  backend_set_name           = each.value.backend_set_name
  network_load_balancer_id   = module.network_load_balancer[each.value.network_load_balancer_name].id
  backend_port               = each.value.backend_port
  backend_target_id          = each.value.backend_target_id
  depends_on = [module.network_load_balancer_backend_set]
}

# Create network load balancer listeners
module "network_load_balancer_listener" {
  source                     = "../modules/nlb-listener"
  for_each                   = { for listener in local.nlb_yaml.network_load_balancer_listener_map : listener.listener_name => listener }
  listener_name              = each.value.listener_name
  backend_set_name           = each.value.backend_set_name
  network_load_balancer_id   = module.network_load_balancer[each.value.network_load_balancer_name].id
  listener_port              = each.value.listener_port
  listener_protocol          = each.value.listener_protocol
  ip_version                 = each.value.ip_version
  depends_on = [module.network_load_balancer_backend_set]
}

# Outputs
output "network_load_balancers" {
  description = "Network Load Balancers created"
  value       = module.network_load_balancer
}

output "backend_sets" {
  description = "Backend Sets created"
  value       = module.network_load_balancer_backend_set
}

output "backends" {
  description = "Backends created"
  value       = module.network_load_balancer_backend
}

output "listeners" {
  description = "Listeners created"
  value       = module.network_load_balancer_listener
}



