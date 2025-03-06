locals {
  # Load YAML file
  nlb_yaml = yamldecode(file("nlb_config.yaml"))

}