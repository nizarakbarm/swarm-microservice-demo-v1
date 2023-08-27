terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.20.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.9.0"
    }
    null = {
      source = "hashicorp/null"
      version = "3.2.1"
    }
  }
}

provider "kubernetes" {
    config_path = "~/.kube/config"
}
provider "helm" {
    kubernetes {
        config_path = "~/.kube/config"
    }
}