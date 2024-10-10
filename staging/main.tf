module "app" {
  source          = "../modules/app"
  environment     = var.environment
  network_name    = docker_network.shared_network.name
  db_host         = var.db_host
  db_user         = var.db_user
  db_password     = var.db_password
  db_name         = var.db_name
  app_port_external = var.app_port_external
  app_port_internal = var.app_port_internal
}

module "db" {
  source          = "../modules/db"
  environment     = var.environment
  network_name    = docker_network.shared_network.name
  db_host         = var.db_host
  db_name         = var.db_name
  db_user         = var.db_user
  db_password     = var.db_password
  db_port_internal = var.db_port_internal
  db_port_external = var.db_port_external
  db_root_password= var.db_root_password
}

resource "docker_network" "shared_network" {
  name = "shared_network"
}
