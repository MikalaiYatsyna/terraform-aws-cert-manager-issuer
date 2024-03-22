resource "kubernetes_manifest" "letsencrypt_issuer" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "ClusterIssuer"
    "metadata" = {
      "name" = "${var.stack}-letsencrypt-issuer"
    }
    "spec" = {
      "acme" = {
        "email"  = var.email
        "server" = var.letsencrypt_server
        "privateKeySecretRef" = {
          "name" = "${var.stack}-letsencrypt-private-key"
        }
        "solvers" = [
          {
            "dns01" = {
              "route53" = {
                "region" : var.aws_region
                "hostedZoneID" = var.route53_zone_id
              }
            }
          }
        ]
      }
    }
  }
}
