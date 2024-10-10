variable "environment" {
  type = string
}

variable "app_ips" {
  type = list(string)
  description = "Liste des adresses IP des instances de l'application"
}

variable "network_name" {
  description = "Nom du réseau pour le container"
  type        = string
}