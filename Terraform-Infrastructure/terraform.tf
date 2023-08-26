terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.14.0"
    }
    kubernetes = {
        source = "hashicorp/kubernetes"
        version = "2.23.0"
    }
    helm = {
        source = "hashicorp/helm"
        version = "2.10.1"
    }
  }
  required_version = ">= 1.5.4"
}