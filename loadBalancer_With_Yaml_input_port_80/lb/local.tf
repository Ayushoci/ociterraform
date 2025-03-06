locals {
  # Load YAML file
  config = yamldecode(file("lbconfig.yaml"))

}