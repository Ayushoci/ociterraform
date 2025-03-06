# Load Balancers Module
module "load_balancers" {
  source   = "../modules/lb"
  for_each = { for lb in local.config.load_balancer_map : lb.display_name => lb }

  compartment_id = local.config.compartment_id

  display_name = each.value.display_name
  shape        = each.value.shape
  subnet_ids   = [each.value.subnet_ids[0]]  # Use only one subnet for regional LB
  defined_tags = lookup(each.value, "defined_tags", {})
  is_private   = each.value.is_private

  # Handle shape details
  minimum_bandwidth_in_mbps = each.value.shape_details.minimum_bandwidth_in_mbps
  maximum_bandwidth_in_mbps = each.value.shape_details.maximum_bandwidth_in_mbps
}

# Backend Sets Module
module "load_balancer_backend_sets" {
  source   = "../modules/lb-backend-set"
  for_each = { for bs in local.config.backend_set_map : bs.display_name => bs }

  compartment_id   = local.config.compartment_id
  load_balancer_id = module.load_balancers[each.value.load_balancer_name].load_balancer_id

  display_name = each.value.display_name
  protocol     = each.value.protocol

  # Health Checker Configuration
  health_check_protocol    = each.value.health_check_protocol
  health_check_port        = each.value.health_check_port
  health_check_path        = each.value.health_check_path
  health_check_interval_ms = each.value.health_check_interval_ms
  health_check_timeout_ms  = each.value.health_check_timeout_ms
  health_check_retries     = each.value.health_check_retries

  # Session Persistence
  lb_cookie_session_persistence_enabled = each.value.lb_cookie_session_persistence_enabled
  session_persistence_cookie_name       = lookup(each.value, "session_persistence_cookie_name", null)
}

# Backends Module
module "load_balancer_backends" {
  source   = "../modules/lb-backend"
  for_each = { for backend in local.config.backend_map : "${backend.load_balancer_name}-${backend.backend_target_id}" => backend }

  load_balancer_id  = module.load_balancers[each.value.load_balancer_name].load_balancer_id
  backendset_name   = each.value.backend_set_name
  backend_target_id = each.value.backend_target_id
  backend_port      = each.value.backend_port
  weight            = lookup(each.value, "weight", 1)

  # Add explicit dependency on backend set
  depends_on = [module.load_balancer_backend_sets]
}

# Listeners Module
module "load_balancer_listeners" {
  source   = "../modules/lb-listener"
  for_each = { for listener in local.config.listener_map : listener.listener_name => listener }

  load_balancer_id  = module.load_balancers[each.value.load_balancer_name].load_balancer_id
  backendset_name   = each.value.backend_set_name
  listener_name     = each.value.listener_name
  listener_port     = each.value.port
  listener_protocol = each.value.protocol

  # Add explicit dependencies
  depends_on = [module.load_balancer_backend_sets, module.load_balancer_backends]
}

# Outputs
output "load_balancer_ids" {
  value = { for k, lb in module.load_balancers : k => lb.load_balancer_id }
}