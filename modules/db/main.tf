resource "docker_container" "db" {
  count = var.app_instance_count

  name  = "${var.environment}-db-${count.index}"
  image = "mariadb:latest"
  
  depends_on = [docker_volume.db_data] # Dépendance explicite ajoutée

  env = [
    "MYSQL_ROOT_PASSWORD=${var.db_root_password}",
    "MYSQL_DATABASE=${var.db_name}",
    "MYSQL_USER=${var.db_user}",
    "MYSQL_PASSWORD=${var.db_password}"
  ]

  ports {
    internal = var.db_port_internal
    external = var.db_port_external + count.index
  }

  volumes {
    volume_name    = docker_volume.db_data.name
    container_path = "/var/lib/mysql" 
  }

  network_mode = var.network_name
}


resource "docker_volume" "db_data" {
  name = "${var.environment}-db-data"
}
