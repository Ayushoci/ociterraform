module "security_lists" {
    source  = "./modules"
    compartment_id = var.compartment_id
    security_lists = var.security_lists_var
   }