variable "stack" {
  type        = string
  description = "Stack name e.g dev/test/prod"
}

variable "email" {
  type        = string
  description = "Email to be used in acme"
}

variable "acme_server" {
  type        = string
  description = "ACME server to user"
  default     = "https://acme-staging-v02.api.letsencrypt.org/directory"
}

variable "cluster_name" {
  type        = string
  description = "Name of EKS cluster"
}

variable "domain" {
  type        = string
  description = "Root application domain name"
}
variable "region" {
  description = "Region for Issuer"
  type        = string
}
