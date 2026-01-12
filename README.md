# NewRelic One Terraform Module

Terraform module to manage [NewRelic One](https://newrelic.com) resources (batteries included).

## Usage

```hcl
module "example" {
  source  = "Tensho/one/newrelic//modules/alert-policies"
  version = "1.3.0"

  policies = {
    "alice" = {
      name                = "Alice"
      description         = "Example alert policy managed by Terraform"
      incident_preference = "PER_POLICY"

      nrql_conditions = {
        "high-error-rate" = {
          name        = "High Error Rate"
          description = "Alice has high error rate"
          enabled     = true

          nrql = {
            query = "SELECT count(*) FROM TransactionError"
          }

          critical = {
            operator              = "above"
            threshold             = 42
            threshold_duration    = 600
            threshold_occurrences = "ALL"
          }

          warning = {
            operator              = "above_or_equals"
            threshold             = 42
            threshold_duration    = 300
            threshold_occurrences = "AT_LEAST_ONCE"
          }

          fill_option = "static"
          fill_value  = 0

          aggregation_window = 60
          aggregation_method = "event_flow"
          aggregation_delay  = 120
        },
        "high-response-time" = {
          name        = "High Response Time"
          description = "Alice has high response time"

          nrql = {
            query = "SELECT average(duration) FROM Transaction"
          }

          critical = {
            operator              = "above_or_equals"
            threshold             = 42
            threshold_duration    = 600
            threshold_occurrences = "ALL"
          }
        }
      }
    }
  }
}
```

Check out comprehensive examples in [`examples`](./examples) folder.

## Features

* [x] [NewRelic alert policies](https://docs.newrelic.com/docs/alerts-applied-intelligence/new-relic-alerts/alert-policies/)
* [x] [NewRelic NRQL conditions](https://docs.newrelic.com/docs/alerts-applied-intelligence/new-relic-alerts/alert-conditions/create-nrql-alert-conditions/)
* [x] [NewRelic notification channels](https://docs.newrelic.com/docs/alerts-applied-intelligence/notifications/intro-notifications/)
* [x] [NewRelic workflows](https://docs.newrelic.com/docs/alerts-applied-intelligence/applied-intelligence/incident-workflows/incident-workflows/)
* [x] [NewRelic dashboards](https://docs.newrelic.com/docs/query-your-data/explore-query-data/dashboards/introduction-dashboards/)
* [x] [NewRelic synthetics monitors](https://docs.newrelic.com/docs/synthetics/synthetic-monitoring/using-monitors/intro-synthetic-monitoring/)
* [x] [NewRelic account management](https://docs.newrelic.com/docs/accounts/accounts-billing/account-structure/add-accounts/)
* [ ] [NewRelic tags](https://docs.newrelic.com/docs/new-relic-solutions/new-relic-one/core-concepts/use-tags-help-organize-find-your-data/)

## Contributing

This project uses [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/).

### Prerequisites

#### MacOS

```shell
mise install
prek install
tflint --init
```

#### Provider Authentication

Consider environment variables management for Terraform provider authentication via `.env` file, which [mise](https://mise.jdx.dev/)
picks up automatically:

```
NEW_RELIC_REGION=US
NEW_RELIC_ACCOUNT_ID=<REDACTED>
NEW_RELIC_API_KEY=<REDACTED>
```

##### NewRelic

```shell
export NEW_RELIC_REGION=US
export NEW_RELIC_ACCOUNT_ID=<REDACTED>
export NEW_RELIC_API_KEY=<REDACTED>
```

### Testing

```shell
cd modules/alert-policies
terraform init
terraform test

cd modules/alert-notifications
terraform init
terraform test

cd modules/dashboards
terraform init
terraform test

cd modules/synthetics-monitors
terraform init
terraform test

cd modules/account-management
terraform init
terraform test
```
