## Introduction
Terraform module to create cert-manager ClusterIssuer with ACME

<!-- BEGIN_TF_DOCS -->
  
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.7.5 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.28.0 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.28.0 |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [kubernetes_manifest.letsencrypt_issuer](https://registry.terraform.io/providers/hashicorp/kubernetes/2.28.0/docs/resources/manifest) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region. | `string` | n/a | yes |
| <a name="input_cluster_ca"></a> [cluster\_ca](#input\_cluster\_ca) | CA certificate of the cluster. | `string` | n/a | yes |
| <a name="input_cluster_endpoint"></a> [cluster\_endpoint](#input\_cluster\_endpoint) | Endpoint of the cluster. | `string` | n/a | yes |
| <a name="input_email"></a> [email](#input\_email) | Email to be used in acme | `string` | n/a | yes |
| <a name="input_k8s_exec_args"></a> [k8s\_exec\_args](#input\_k8s\_exec\_args) | Args for Kubernetes provider exec plugin. Example command ['eks', 'get-token', '--cluster-name', '{clusterName}}'] | `list(string)` | n/a | yes |
| <a name="input_k8s_exec_command"></a> [k8s\_exec\_command](#input\_k8s\_exec\_command) | Command name for Kubernetes provider exec plugin. Example - 'aws | `string` | n/a | yes |
| <a name="input_letsencrypt_server"></a> [letsencrypt\_server](#input\_letsencrypt\_server) | Letsencrypt server. Use prod by default. Override to staging for test | `string` | `"https://acme-v02.api.letsencrypt.org/directory"` | no |
| <a name="input_route53_zone_id"></a> [route53\_zone\_id](#input\_route53\_zone\_id) | Id of Route 53 hosted zone. | `string` | n/a | yes |
| <a name="input_stack"></a> [stack](#input\_stack) | Stack name e.g dev/test/prod | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_letsencrypt_issuer"></a> [letsencrypt\_issuer](#output\_letsencrypt\_issuer) | n/a |
<!-- END_TF_DOCS -->
