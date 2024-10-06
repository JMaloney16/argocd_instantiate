terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.7.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.1"
    }
  }
}

provider "kubernetes" {
  host     = var.host
  token    = var.token
  insecure = var.insecure
}

provider "helm" {
  kubernetes {
    host     = var.host
    token    = var.token
    insecure = var.insecure
  }
}