# NewRelic Synthetics Monitors Terraform Module

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_newrelic"></a> [newrelic](#requirement\_newrelic) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_newrelic"></a> [newrelic](#provider\_newrelic) | 3.76.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [newrelic_synthetics_broken_links_monitor.default](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/synthetics_broken_links_monitor) | resource |
| [newrelic_synthetics_cert_check_monitor.default](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/synthetics_cert_check_monitor) | resource |
| [newrelic_synthetics_monitor.browser](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/synthetics_monitor) | resource |
| [newrelic_synthetics_monitor.simple](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/synthetics_monitor) | resource |
| [newrelic_synthetics_script_monitor.script_api](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/synthetics_script_monitor) | resource |
| [newrelic_synthetics_script_monitor.script_browser](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/synthetics_script_monitor) | resource |
| [newrelic_synthetics_step_monitor.default](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/synthetics_step_monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_synthetics_monitors"></a> [synthetics\_monitors](#input\_synthetics\_monitors) | Synthetics monitors by type (simple, browser, broken\_links, script\_browser, script\_api, cert\_check, step\_monitor, etc.) | <pre>map(map(object({<br/>    name   = string<br/>    status = string<br/>    period = string<br/><br/>    locations_public  = list(string)<br/>    locations_private = optional(list(string), [])<br/><br/>    uri                                     = optional(string, null)<br/>    domain                                  = optional(string, null)<br/>    certificate_expiration                  = optional(number, null)<br/>    validation_string                       = optional(string, null)<br/>    verify_ssl                              = optional(bool, false)<br/>    treat_redirect_as_failure               = optional(bool, false)<br/>    bypass_head_request                     = optional(bool, false)<br/>    enable_screenshot_on_failure_and_script = optional(bool, null)<br/>    runtime_type_version                    = optional(string, null)<br/>    runtime_type                            = optional(string, null)<br/>    script_language                         = optional(string, null)<br/>    script                                  = optional(string, null)<br/>    devices                                 = optional(list(string), null)<br/>    browsers                                = optional(list(string), null)<br/><br/>    steps = optional(list(object({<br/>      ordinal = number<br/>      type    = string<br/>      values  = optional(list(string), null)<br/>    })), [])<br/><br/>    custom_header = optional(list(object({<br/>      name  = string<br/>      value = string<br/>    })), [])<br/><br/>    tag = optional(list(object({<br/>      key    = string<br/>      values = list(string)<br/>    })), [])<br/>  })))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_broken_links_synthetic_monitor_ids"></a> [broken\_links\_synthetic\_monitor\_ids](#output\_broken\_links\_synthetic\_monitor\_ids) | Broken links synthetics monitor IDs |
| <a name="output_browser_synthetic_monitor_ids"></a> [browser\_synthetic\_monitor\_ids](#output\_browser\_synthetic\_monitor\_ids) | Browser synthetics monitor IDs |
| <a name="output_cert_check_synthetic_monitor_ids"></a> [cert\_check\_synthetic\_monitor\_ids](#output\_cert\_check\_synthetic\_monitor\_ids) | Certificate check synthetics monitor IDs |
| <a name="output_script_api_synthetic_monitor_ids"></a> [script\_api\_synthetic\_monitor\_ids](#output\_script\_api\_synthetic\_monitor\_ids) | Script API synthetics monitor IDs |
| <a name="output_script_browser_synthetic_monitor_ids"></a> [script\_browser\_synthetic\_monitor\_ids](#output\_script\_browser\_synthetic\_monitor\_ids) | Script browser synthetics monitor IDs |
| <a name="output_simple_synthetic_monitor_ids"></a> [simple\_synthetic\_monitor\_ids](#output\_simple\_synthetic\_monitor\_ids) | Simple synthetics monitor IDs |
| <a name="output_step_monitor_synthetic_monitor_ids"></a> [step\_monitor\_synthetic\_monitor\_ids](#output\_step\_monitor\_synthetic\_monitor\_ids) | Step monitor synthetics monitor IDs |
<!-- END_TF_DOCS -->

