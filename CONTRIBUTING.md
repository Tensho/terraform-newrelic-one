# Contributing

This project uses [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/).

## Prerequisites

```shell
mise install
prek install
tflint --init
```

### Provider Authentication

```shell
export NEW_RELIC_REGION=US
export NEW_RELIC_ACCOUNT_ID=<REDACTED>
export NEW_RELIC_API_KEY=<REDACTED>
```

## Testing

Run the sub-module test suite:

```shell
cd modules/alert-policies
terraform init
terraform test -verbose
```
