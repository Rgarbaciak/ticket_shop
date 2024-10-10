# Projet d'Infrastructure as Code avec Terraform

Ce projet utilise Terraform pour provisionner une infrastructure comprenant des conteneurs Docker.

## Prérequis

- [Terraform](https://www.terraform.io/downloads.html) installé
- [Docker](https://docs.docker.com/get-docker/) installé et configuré
- Accès à une instance Docker avec Docker Desktop ou une VM avec Docker installé
- [Git](https://git-scm.com/) pour cloner le dépôt

## Installation

### 1. **Cloner le dépôt**
```bash
git clone https://github.com/Rgarbaciak/ticket_shop/
cd <Projet>
```

## Configuration des fichiers secrets

Avant de lancer le projet, vous devez créer des fichiers de variables contenant les informations sensibles pour la base de données et l'application. Ces fichiers doivent être ajoutés dans le dossier de l'environnement (`dev`, `staging`, `prod`) correspondant.

### 1. Fichier `db.auto.tfvars`

Créez un fichier `db.auto.tfvars` dans le dossier de votre environnement avec le contenu suivant :

```hcl
db_host           = "NOM_DU_SERVEUR_BD"
db_user           = "UTILISATEUR_BD"
db_password       = "MOT_DE_PASSE_BD"
db_name           = "NOM_DE_LA_BASE_DE_DONNÉES"
db_port_internal  = PORT_INTERNE_BD
db_port_external  = PORT_EXTERNE_BD
db_root_password  = "MOT_DE_PASSE_ROOT_BD"
```
### 2. Fichier `dev.tfvars` ou `prod.tfvars` ou `staging.tfvars`
```hcl
environment         = "NOM_ENVIRONNEMENT"
db_host             = "NOM_DU_SERVEUR_BD"
db_user             = "UTILISATEUR_BD"
db_password         = "MOT_DE_PASSE_BD"
app_port_internal   = PORT_INTERNE_APP
app_port_external   = PORT_EXTERNE_APP
app_instance_count  = NOMBRE_INSTANCES_APP
app_ips             = ["IP_APP_1", "IP_APP_2", "IP_APP_3"]

```
**Note** : Ces fichiers sont nécessaires pour configurer l'infrastructure correctement avec Terraform.

## Configurer l'environnement Terraform
Depuis la racine du projet, initialisez les modules et plugins Terraform.
```bash
terraform init
```

## Choisir l'environnement
Selon l'environnement souhaité (dev, staging, prod), déplacez-vous dans le dossier correspondant et appliquez la configuration :
```bash
cd <ENVIRONNEMENT>
terraform apply -var-file="<ENVIRONNEMENT>.tfvars"
```

## Deployer l'infrastructure
Pour déployer, exécutez la commande suivante :
```bash
terraform apply -var-file="<ENVIRONNEMENT>.tfvars"
```
