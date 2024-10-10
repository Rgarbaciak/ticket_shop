terraform {
  backend "local" {
    path = "staging/terraform.tfstate"
  }
}
