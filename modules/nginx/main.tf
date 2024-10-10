resource "local_file" "nginx_config" {
  content = templatefile("${path.module}/nginx.template", {
    app_ips = var.app_ips
  })
  filename = "${path.module}/nginx.conf"
}

resource "docker_image" "nginx" {
  name = "nginx:stable"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "${var.environment}-nginx"

  ports {
    internal = 80
    external = 80
  }

  volumes {
    host_path      = abspath("${local_file.nginx_config.filename}")
    container_path = "/etc/nginx/nginx.conf"
  }

  depends_on = [docker_image.nginx]
  network_mode = var.network_name

}

output "nginx_container_id" {
  value = docker_container.nginx.id
}
