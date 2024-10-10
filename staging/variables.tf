variable "environment" {
  description = "L'environnement actuel"
  type        = string
}

variable "app_instance_count" {
  description = "Nombre d'instances d'applications à déployer"
  default     = 3
}

variable "db_password" {
  description = "Mot de passe de la base de données"
  type        = string
}
variable "db_root_password" {
  description = "Mot de passe root de la base de données"
  type        = string
}
variable "db_user" {
  description = "Utilisateur de la base de données"
  type        = string
}

variable "db_host" {
  description = "Hôte de la base de données"
  type        = string
}

variable "app_port_internal" {
  description = "Port interne de l'application"
  type        = number
}

variable "app_port_external" {
  description = "Port externe de l'application"
  type        = number
}
variable "db_name" {
  description = "Nom de la base de données"
  type        = string
}

variable "db_port_internal" {
  description = "Port interne de la base de données"
  type        = number
}

variable "db_port_external" {
  description = "Port externe de la base de données"
  type        = number
}

variable "app_ips" {
  type        = list(string)
  description = "Liste des adresses IP des instances de l'application"
}
