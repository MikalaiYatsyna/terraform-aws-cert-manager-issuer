## Introduction
Terraform module to create cert-manager ClusterIssuer with ACME

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.7.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.42.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.27.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.42.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.27.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_manifest.letsencrypt_issuer](https://registry.terraform.io/providers/hashicorp/kubernetes/2.27.0/docs/resources/manifest) | resource |
| [aws_eks_cluster.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/5.42.0/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.eks_cluster_auth](https://registry.terraform.io/providers/hashicorp/aws/5.42.0/docs/data-sources/eks_cluster_auth) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/5.42.0/docs/data-sources/region) | data source |
| [aws_route53_zone.zone](https://registry.terraform.io/providers/hashicorp/aws/5.42.0/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of EKS cluster | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | Root application domain name | `string` | n/a | yes |
| <a name="input_email"></a> [email](#input\_email) | Email to be used in acme | `string` | n/a | yes |
| <a name="input_letsencrypt_server"></a> [letsencrypt\_server](#input\_letsencrypt\_server) | Letsencrypt server. Use prod by default. Override to staging for test | `string` | `"https://acme-v02.api.letsencrypt.org/directory"` | no |
| <a name="input_stack"></a> [stack](#input\_stack) | Stack name e.g dev/test/prod | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_letsencrypt_issuer"></a> [letsencrypt\_issuer](#output\_letsencrypt\_issuer) | n/a |
<!-- END_TF_DOCS -->
