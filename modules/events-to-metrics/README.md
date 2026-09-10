# NewRelic Events to Metrics Terraform Module

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
| [newrelic_events_to_metrics_rule.default](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/events_to_metrics_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_rules"></a> [rules](#input\_rules) | Events to metrics rules keyed by logical name. Each rule turns matching events into metrics with a `SELECT` NRQL statement, where every aggregated value is aliased to the target metric name. The API accepts only the `summary`, `uniqueCount`, and `distribution` query functions. The provider does not infer `account_id` for this resource, so it is required per rule. `name`, `nrql`, and `description` are immutable, so changing them replaces the rule. | <pre>map(object({<br/>    name        = string<br/>    nrql        = string<br/>    account_id  = number<br/>    description = optional(string)<br/>    enabled     = optional(bool)<br/>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_rules"></a> [rules](#output\_rules) | Events to metrics rules keyed by logical name |
<!-- END_TF_DOCS -->
