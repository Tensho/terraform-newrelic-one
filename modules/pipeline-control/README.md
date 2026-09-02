# NewRelic Pipeline Control Terraform Module

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_newrelic"></a> [newrelic](#requirement\_newrelic) | ~> 3.68 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_newrelic"></a> [newrelic](#provider\_newrelic) | ~> 3.68 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [newrelic_pipeline_cloud_rule.default](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/pipeline_cloud_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_cloud_rules"></a> [cloud\_rules](#input\_cloud\_rules) | Pipeline cloud rules keyed by logical name. Each rule drops matching data at ingest with a `DELETE FROM` NRQL statement. `account_id` defaults to the provider account. Pipeline cloud rules replace the end-of-life `newrelic_nrql_drop_rule` resource. | <pre>map(object({<br/>    name        = string<br/>    nrql        = string<br/>    description = optional(string)<br/>    account_id  = optional(number)<br/>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_cloud_rules"></a> [cloud\_rules](#output\_cloud\_rules) | Pipeline cloud rules keyed by logical name |
<!-- END_TF_DOCS -->
