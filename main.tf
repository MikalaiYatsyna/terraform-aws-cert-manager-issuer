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
                "region" : data.aws_region.current.name
                "hostedZoneID" = data.aws_route53_zone.zone.id
              }
            }
          }
        ]
      }
    }
  }
}

resource "kubernetes_manifest" "self_signed_issuer" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "Issuer"
    "metadata" = {
      "name" = "${var.namespace}-self-signed-issuer"
      "namespace" = var.namespace
    }
    "spec" = {
      "selfSigned" = {}
    }
  }
}

resource "kubernetes_manifest" "core_ca" {
  manifest   = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "Certificate"
    "metadata"   = {
      "name"      = "${var.namespace}-ca"
      "namespace" = var.namespace
    }
    "spec" = {
      "isCA" = true
      "secretName" = "ca-secret"
      "issuerRef" = {
        "name" = kubernetes_manifest.self_signed_issuer.manifest.metadata.name
        "kind" = "Issuer"
      }
      "usages" = ["server auth", "client auth"]
      "dnsNames" = [
        var.namespace,
        "${var.namespace}.svc",
        "${var.namespace}.svc.cluster",
        "${var.namespace}.svc.cluster.local"
      ]
    }
  }
}

resource "kubernetes_manifest" "ca_issuer" {
  depends_on = [kubernetes_manifest.core_ca]
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "Issuer"
    "metadata" = {
      "name" = "${var.stack}-ca-issuer"
      namespace = var.namespace
    }
    "spec" = {
      "ca" = {
        secretName = kubernetes_manifest.core_ca.manifest.spec.secretName
      }
    }
  }
}
