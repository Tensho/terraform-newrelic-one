# NewRelic Dashboards Terraform Module 

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_newrelic"></a> [newrelic](#requirement\_newrelic) | ~> 3.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_newrelic"></a> [newrelic](#provider\_newrelic) | 3.75.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [newrelic_one_dashboard_json.default](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/one_dashboard_json) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dashboards"></a> [dashboards](#input\_dashboards) | Dashboards | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dashboard_ids"></a> [dashboard\_ids](#output\_dashboard\_ids) | Dashboard IDs |
<!-- END_TF_DOCS -->