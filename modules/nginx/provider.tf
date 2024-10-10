terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"  # Pour Windows
  # host = "unix:///var/run/docker.sock"   # Pour Linux
}
