resource "docker_container" "app" {
  count = var.app_instance_count
  name  = "${var.environment}-app-${count.index}"
  image = "prestashop/prestashop:latest"

  env = [
    "DB_SERVER=${var.db_host}",
    "db_name=${var.db_name}",
    "DB_USER=${var.db_user}",
    "db_password=${var.db_password}",
  ]

  ports {
    internal = var.app_port_internal
    external = var.app_port_external + count.index
  }

  network_mode = var.network_name
}

output "app_ips" {
  value = [for container in docker_container.app : container.network_data[0].ip_address]
}