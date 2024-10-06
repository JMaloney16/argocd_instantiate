locals {
  argocd_values = var.argocd_values == "" ? "${path.module}/configs/argo-values.yaml" : var.argocd_values
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {
  name      = "argocd"
  namespace = kubernetes_namespace.argocd.metadata.0.name

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.argocd_version

  values = [
    file("${local.argocd_values}")
  ]

  set {
    name  = "configs.secret.argocdServerAdminPassword"
    value = var.argocd_password
  }
}