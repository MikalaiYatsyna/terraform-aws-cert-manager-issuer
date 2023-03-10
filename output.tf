output "name" {
  value = kubernetes_manifest.acme_issuer.manifest.metadata["name"]
}
