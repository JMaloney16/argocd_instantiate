variable "host" {
  description = "The host cluster."
}

variable "token" {
  description = "The token for the host cluster."
}

variable "insecure" {
  description = "value for the kubernetes insecure flag."
  type        = bool
  default     = "false"
}

variable "namespace" {
  description = "The namespace to install argocd in"
  type        = string
  default     = "argocd"
}

variable "argocd_version" {
  description = "Version of the argo-cd chart to use."
  type        = string
  default     = "7.6.8"
}

variable "argocd_values" {
  description = "File path to values.yaml for argo-cd chart."
  type        = string
  default     = ""
}

variable "argocd_password" {
  description = "The password for the argocd admin user."
  type        = string
  sensitive   = true
}