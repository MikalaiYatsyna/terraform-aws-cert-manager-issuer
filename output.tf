output "letsencrypt_issuer" {
  value = kubernetes_manifest.letsencrypt_issuer.manifest.metadata.name
}
output "ca_issuer" {
  value = kubernetes_manifest.ca_issuer.manifest.metadata.name
}
