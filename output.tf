output "name" {
  value = kubernetes_manifest.acme_issuer.manifest.metadata[0].name
}
