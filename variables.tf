variable "stack" {
  type        = string
  description = "Stack name e.g dev/test/prod"
}

variable "email" {
  type        = string
  description = "Email to be used in acme"
}

variable "cluster_name" {
  type        = string
  description = "Name of EKS cluster"
}

variable "domain" {
  type        = string
  description = "Root application domain name"
}

variable "letsencrypt_server" {
  type        = string
  description = "Letsencrypt server. Use prod by default. Override to staging for test"
  default     = "https://acme-v02.api.letsencrypt.org/directory"
}

variable "namespace" {
  type        = string
  description = "Namespace where to store CA"
}
