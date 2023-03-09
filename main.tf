resource "kubernetes_manifest" "acme_issuer" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "ClusterIssuer"
    "metadata" = {
      "name" = "${var.stack}-acme-issuer"
    }
    "spec" = {
      "acme" = {
        "email"  = var.email
        "server" = var.acme_server
        "privateKeySecretRef" = {
          "name" = "letsencrypt-${var.stack}"
        }
        "solvers" = [
          {
            "dns01" = {
              "route53" = {
                "region" : var.region
                "hostedZoneID" = data.aws_route53_zone.zone.id
              }
            }
          }
        ]
      }
    }
  }
}

