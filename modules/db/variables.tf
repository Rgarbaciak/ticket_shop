variable "environment" {
  type = string
}

variable "db_host" {
  description = "Hôte de la base de données"
  type        = string
}

variable "db_name" {
  description = "Nom de la base de données"
  type        = string
}

variable "db_user" {
  description = "Utilisateur de la base de données"
  type        = string
}

variable "db_password" {
  description = "Mot de passe de la base de données"
  type        = string
  sensitive   = true
}

variable "db_port_internal" {
  description = "Port interne de la base de données"
  type        = number
}

variable "db_port_external" {
  description = "Port externe de la base de données"
  type        = number
}

variable "network_name" {
  description = "Nom du réseau pour le container"
  type        = string
}
variable "db_root_password" {
  description = "Mot de passe root de la base de données"
  type        = string
}

variable "app_instance_count" {
  description = "Nombre d'instances de l'application"
  type        = number
  default     = 1
}
