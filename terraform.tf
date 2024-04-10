terraform {
  required_version = "1.8.0"
  required_providers {
    kubernetes = {
      version = "2.27.0"
      source  = "hashicorp/kubernetes"
    }
  }
}
