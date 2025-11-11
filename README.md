# NewRelic Alert Policy Terraform Module

Terraform module to manage [NewRelic One](https://newrelic.com) resources (batteries included).

## Usage

```hcl
module "example" {
  source  = "Tensho/one/newrelic"
  version = "1.0.0"

  ...
}
```

Check out comprehensive examples in [`examples`](./examples) folder.

## Features

* [x] [NewRelic alert policies](https://docs.newrelic.com/docs/alerts-applied-intelligence/new-relic-alerts/alert-policies/)
* [x] [NewRelic NRQL conditions](https://docs.newrelic.com/docs/alerts-applied-intelligence/new-relic-alerts/alert-conditions/create-nrql-alert-conditions/)
* [ ] [NewRelic notification channels](https://docs.newrelic.com/docs/alerts-applied-intelligence/notifications/intro-notifications/)
* [ ] [NewRelic workflows](https://docs.newrelic.com/docs/alerts-applied-intelligence/applied-intelligence/incident-workflows/incident-workflows/)

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->

## Contributing

This project uses [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/).

### Prerequisites

#### MacOS

```shell
mise install
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

### Testing

```shell
cd modules/alerts/policies
terraform init
terraform test
```
