# NewRelic Alert Policy Terraform Module

Terraform module to manage [NewRelic](https://newrelic.com) alert policy resources (batteries included).

## Usage

> [!WARNING]
> NewRelic alert policy requires proper authentication. Make sure to set the appropriate environment variables or provider configuration.

```hcl
module "example" {
  source  = "Tensho/one/newrelic"
  version = "1.0.0"

  name               = "Example Alert Policy"
  description        = "Example alert policy managed by Terraform"
  incident_preference = "PER_POLICY"

  nrql_conditions = [
    {
      name        = "High Error Rate"
      description = "Alert when error rate exceeds threshold"
      enabled     = true

      nrql = {
        query = "SELECT count(*) FROM TransactionError WHERE appName = 'Example App'"
      }

      critical = {
        operator              = "above"
        threshold             = 100
        threshold_duration    = 300
        threshold_occurrences = "ALL"
      }

      warning = {
        operator              = "above"
        threshold             = 50
        threshold_duration    = 300
        threshold_occurrences = "ALL"
      }

      fill_option        = "static"
      fill_value         = 0
      aggregation_window = 60
      aggregation_method = "event_flow"
      aggregation_delay  = 120
    },
    {
      name        = "High Response Time"
      description = "Alert when response time is too high"
      enabled     = true

      nrql = {
        query = "SELECT average(duration) FROM Transaction WHERE appName = 'Example App'"
      }

      critical = {
        operator              = "above"
        threshold             = 2.0
        threshold_duration    = 600
        threshold_occurrences = "ALL"
      }

      aggregation_window = 60
      aggregation_method = "event_flow"
    }
  ]

  notification_channels = [
    {
      name = "Email Notifications"
      type = "EMAIL"
      
      config = {
        recipients              = "team@example.com"
        include_json_attachment = "false"
      }
    },
    {
      name = "Slack Notifications"
      type = "SLACK"
      
      config = {
        channel = "#alerts"
        url     = "https://hooks.slack.com/services/YOUR/WEBHOOK/URL"
      }
    }
  ]
}
```

Check out comprehensive examples in [`examples`](./examples) folder.

## Features

* [x] [NewRelic alert policies](https://docs.newrelic.com/docs/alerts-applied-intelligence/new-relic-alerts/alert-policies/)
* [x] [NewRelic NRQL alert conditions](https://docs.newrelic.com/docs/alerts-applied-intelligence/new-relic-alerts/alert-conditions/create-nrql-alert-conditions/)
* [x] [NewRelic notification channels](https://docs.newrelic.com/docs/alerts-applied-intelligence/notifications/intro-notifications/)
* [x] [NewRelic workflows](https://docs.newrelic.com/docs/alerts-applied-intelligence/applied-intelligence/incident-workflows/incident-workflows/)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_newrelic"></a> [newrelic](#requirement\_newrelic) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_newrelic"></a> [newrelic](#provider\_newrelic) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [newrelic_alert_policy.default](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/alert_policy) | resource |
| [newrelic_nrql_alert_condition.default](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/nrql_alert_condition) | resource |
| [newrelic_notification_channel.default](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/notification_channel) | resource |
| [newrelic_notification_destination.default](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/notification_destination) | resource |
| [newrelic_workflow.default](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/workflow) | resource |
| [newrelic_account.default](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/data-sources/account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | NewRelic account ID. | `number` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | NewRelic alert policy description. | `string` | `"Managed by Terraform"` | no |
| <a name="input_incident_preference"></a> [incident\_preference](#input\_incident\_preference) | NewRelic alert policy incident rollup preference. | `string` | `"PER_POLICY"` | no |
| <a name="input_name"></a> [name](#input\_name) | NewRelic alert policy name | `string` | n/a | yes |
| <a name="input_notification_channels"></a> [notification\_channels](#input\_notification\_channels) | NewRelic notification channel configurations. | <pre>list(object({<br/>    name = string<br/>    type = string<br/>    <br/>    config = object({<br/>      recipients              = optional(string)<br/>      include_json_attachment = optional(string)<br/>      channel                 = optional(string)<br/>      url                     = optional(string)<br/>      tags                    = optional(string)<br/>      api_key                 = optional(string)<br/>      teams                   = optional(string)<br/>      team_channel            = optional(string)<br/>      service_key             = optional(string)<br/>      route_key               = optional(string)<br/>    })<br/>  }))</pre> | `[]` | no |
| <a name="input_nrql_conditions"></a> [nrql\_conditions](#input\_nrql\_conditions) | NewRelic NRQL alert conditions. | <pre>list(object({<br/>    name        = string<br/>    description = optional(string)<br/>    enabled     = optional(bool, true)<br/>    violation_time_limit_seconds = optional(number)<br/>    <br/>    nrql = object({<br/>      query = string<br/>    })<br/><br/>    critical = object({<br/>      operator              = string<br/>      threshold             = number<br/>      threshold_duration    = number<br/>      threshold_occurrences = optional(string, "ALL")<br/>    })<br/><br/>    warning = optional(object({<br/>      operator              = string<br/>      threshold             = number<br/>      threshold_duration    = number<br/>      threshold_occurrences = optional(string, "ALL")<br/>    }))<br/><br/>    fill_option        = optional(string)<br/>    fill_value         = optional(number)<br/>    aggregation_window = optional(number)<br/>    aggregation_method = optional(string)<br/>    aggregation_delay  = optional(number)<br/>    expiration_duration = optional(number)<br/>    open_violation_on_expiration = optional(bool)<br/>    close_violations_on_expiration = optional(bool)<br/>    slide_by = optional(number)<br/>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alert_policy"></a> [alert\_policy](#output\_alert\_policy) | NewRelic alert policy. |
| <a name="output_alert_policy_id"></a> [alert\_policy\_id](#output\_alert\_policy\_id) | NewRelic alert policy ID. |
| <a name="output_nrql_conditions"></a> [nrql\_conditions](#output\_nrql\_conditions) | NewRelic NRQL alert conditions. |
| <a name="output_workflow"></a> [workflow](#output\_workflow) | NewRelic workflow. |
<!-- END_TF_DOCS -->

## Contributing

This project uses [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/).

### Prerequisites

#### MacOS

```shell
brew install pre-commit tfswitch terraform-docs tflint
pre-commit install --install-hooks
tflint --init
```

#### Provider Authentication

Consider environment variables management for Terraform provider authentication via `.env` file, which [mise](https://mise.jdx.dev/)
picks up automatically:

```
NEW_RELIC_ACCOUNT_ID=<REDACTED>
NEW_RELIC_API_KEY=<REDACTED>
NEW_RELIC_REGION=US
```

##### NewRelic

```shell
export NEW_RELIC_ACCOUNT_ID=<REDACTED>
export NEW_RELIC_API_KEY=<REDACTED>
export NEW_RELIC_REGION=US
```

### Development

#### Basic Alert Policy

```shell
cd examples/basic-alert-policy
terraform init
terraform apply
terraform destroy
```

### Testing

The `terraform test` command looks for `*.tftest.hcl` files in both root directory and `tests` directory.

```shell
terraform init
terraform test
terraform test -filter tests/main.tftest.hcl -verbose
```
