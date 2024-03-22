variable "stack" {
  type        = string
  description = "Stack name e.g dev/test/prod"
}

variable "email" {
  type        = string
  description = "Email to be used in acme"
}

variable "letsencrypt_server" {
  type        = string
  description = "Letsencrypt server. Use prod by default. Override to staging for test"
  default     = "https://acme-v02.api.letsencrypt.org/directory"
}

variable "cluster_endpoint" {
  sensitive   = true
  type        = string
  description = "Endpoint of the cluster."
}

variable "cluster_ca" {
  sensitive   = true
  type        = string
  description = "CA certificate of the cluster."
}

variable "k8s_exec_args" {
  type        = list(string)
  description = "Args for Kubernetes provider exec plugin. Example command ['eks', 'get-token', '--cluster-name', '{clusterName}}']"
}

variable "k8s_exec_command" {
  type        = string
  description = "Command name for Kubernetes provider exec plugin. Example - 'aws"
}

variable "route53_zone_id" {
  type        = string
  description = "Id of Route 53 hosted zone."
}

variable "aws_region" {
  type    = string
  description = "AWS region."
}
