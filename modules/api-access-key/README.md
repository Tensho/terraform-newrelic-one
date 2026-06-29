# NewRelic API Access Key Terraform Module

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_newrelic"></a> [newrelic](#requirement\_newrelic) | ~> 3.4 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_newrelic"></a> [newrelic](#provider\_newrelic) | ~> 3.4 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [newrelic_api_access_key.default](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/api_access_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_api_access_keys"></a> [api\_access\_keys](#input\_api\_access\_keys) | API access keys keyed by logical name. INGEST keys require `ingest_type`; USER keys require `user_id`. The provider does not infer `account_id` for this resource, so it is required per key. | <pre>map(object({<br/>    key_type    = string<br/>    account_id  = number<br/>    ingest_type = optional(string)<br/>    user_id     = optional(number)<br/>    name        = optional(string)<br/>    notes       = optional(string)<br/>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_api_access_keys"></a> [api\_access\_keys](#output\_api\_access\_keys) | API access key values keyed by logical name |
<!-- END_TF_DOCS -->
