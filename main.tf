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
  version    = "7.6.8"

  values = [
    file("${path.module}/configs/argo-values.yaml")
  ]

  set {
    name  = "configs.secret.argocdServerAdminPassword"
    value = var.argocd_password
  }
}