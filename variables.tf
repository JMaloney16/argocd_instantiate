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

variable "argocd_password" {
  description = "The password for the argocd admin user."
  type        = string
  sensitive   = true
}