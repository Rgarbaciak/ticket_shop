module "app" {
  source             = "../modules/app"
  environment        = var.environment
  network_name       = docker_network.shared_network.name
  db_host            = var.db_host
  db_user            = var.db_user
  db_password        = var.db_password
  db_name            = var.db_name
  app_port_external  = var.app_port_external
  app_port_internal  = var.app_port_internal
  app_instance_count = var.app_instance_count
}

module "db" {
  source           = "../modules/db"
  environment      = var.environment
  network_name     = docker_network.shared_network.name
  db_host          = var.db_host
  db_name          = var.db_name
  db_user          = var.db_user
  db_password      = var.db_password
  db_port_internal = var.db_port_internal
  db_port_external = var.db_port_external
  db_root_password = var.db_root_password
}

module "nginx" {
  source      = "../modules/nginx"
  environment = var.environment
  app_ips     = var.app_ips
  network_name     = docker_network.shared_network.name

}

resource "docker_network" "shared_network" {
  name = "shared_network"
}
