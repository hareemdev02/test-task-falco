provider "google" {
  credentials = file("./keys/devops-iz-623ec9915883.json")
  project     = var.project_id
  region      = var.region
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}
