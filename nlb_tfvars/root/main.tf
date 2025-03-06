module "network_load_balancers" {
  source                    = "../modules/nlb"
  compartment_id            = var.compartment_id
  network_load_balancer_map = var.network_load_balancer_map
}

module "network_load_balancer_backend_sets" {
  source = "../modules/nlb-backend_set"

  compartment_id                        = var.compartment_id
  network_load_balancer_ids             = module.network_load_balancers.network_load_balancer_ids
  network_load_balancer_backend_set_map = var.network_load_balancer_backend_set_map

  depends_on = [module.network_load_balancers]
}

module "network_load_balancer_backends" {
  source                            = "../modules/nlb-backend"
  network_load_balancer_ids         = module.network_load_balancers.network_load_balancer_ids
  network_load_balancer_backend_map = var.network_load_balancer_backend_map
  depends_on                        = [module.network_load_balancers, module.network_load_balancer_backend_sets]

}

module "network_load_balancer_listener_map" {
  source                             = "../modules/nlb-listener"
  network_load_balancer_ids          = module.network_load_balancers.network_load_balancer_ids
  network_load_balancer_listener_map = var.network_load_balancer_listener_map

  depends_on = [module.network_load_balancers, module.network_load_balancer_backend_sets]
}