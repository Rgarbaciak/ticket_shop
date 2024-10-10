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
}

variable "db_host" {
  description = "Hôte de la base de données"
  type        = string
}

variable "environment" {
  description = "L'environnement dans lequel l'application est déployée"
  type        = string
}

variable "network_name" {
  type = string
}
variable "app_port_internal" {
  description = "Port interne de l'application"
  type        = number
}

variable "app_port_external" {
  description = "Port externe de l'application"
  type        = number
}

variable "app_instance_count" {
  description = "Nombre d'instances de l'application"
  type        = number
  default     = 3
}