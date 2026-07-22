# NewRelic Alert Policies Terraform Module 

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_newrelic"></a> [newrelic](#requirement\_newrelic) | ~> 3.62 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_newrelic"></a> [newrelic](#provider\_newrelic) | ~> 3.62 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [newrelic_alert_policy.default](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/alert_policy) | resource |
| [newrelic_entity_tags.condition](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/entity_tags) | resource |
| [newrelic_entity_tags.policy](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/entity_tags) | resource |
| [newrelic_nrql_alert_condition.default](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/nrql_alert_condition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_policies"></a> [policies](#input\_policies) | Alert policies with NRQL conditions. | <pre>map(object({<br/>    name                = string<br/>    incident_preference = optional(string)<br/><br/>    tags = optional(map(list(string)), {})<br/><br/>    nrql_conditions = map(object({<br/>      name        = string<br/>      description = optional(string)<br/>      enabled     = optional(bool, true)<br/><br/>      title_template = optional(string)<br/>      runbook_url    = optional(string)<br/><br/>      tags = optional(map(list(string)), {})<br/><br/>      nrql = object({<br/>        query           = string<br/>        data_account_id = optional(number)<br/>      })<br/><br/>      critical = optional(object({<br/>        operator                        = string<br/>        threshold                       = number<br/>        threshold_duration              = number<br/>        threshold_occurrences           = string<br/>        disable_health_status_reporting = optional(bool)<br/>      }))<br/><br/>      warning = optional(object({<br/>        operator                        = string<br/>        threshold                       = number<br/>        threshold_duration              = number<br/>        threshold_occurrences           = string<br/>        disable_health_status_reporting = optional(bool)<br/>      }))<br/><br/>      fill_option        = optional(string)<br/>      fill_value         = optional(number)<br/>      aggregation_window = optional(number)<br/>      aggregation_method = optional(string)<br/>      aggregation_delay  = optional(number)<br/>      aggregation_timer  = optional(number)<br/>      evaluation_delay   = optional(number)<br/>      slide_by           = optional(number)<br/><br/>      type = optional(string, "static")<br/><br/>      baseline_direction = optional(string)<br/>      signal_seasonality = optional(string)<br/><br/>      expiration_duration            = optional(number)<br/>      open_violation_on_expiration   = optional(bool)<br/>      close_violations_on_expiration = optional(bool)<br/>      ignore_on_expected_termination = optional(bool)<br/>      violation_time_limit_seconds   = optional(number)<br/>    }))<br/>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_policy_ids"></a> [policy\_ids](#output\_policy\_ids) | Policy IDs |
<!-- END_TF_DOCS -->