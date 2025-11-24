# NewRelic Notifications Terraform Module 

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_newrelic"></a> [newrelic](#requirement\_newrelic) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_newrelic"></a> [newrelic](#provider\_newrelic) | 3.75.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [newrelic_notification_channel.default](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/notification_channel) | resource |
| [newrelic_notification_destination.default](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/notification_destination) | resource |
| [newrelic_workflow.default](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/workflow) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_destinations"></a> [destinations](#input\_destinations) | Notification destinations. | <pre>map(object({<br/>    name = string<br/>    type = string<br/><br/>    secure_url = optional(object({<br/>      prefix        = string<br/>      secure_suffix = string<br/>    }))<br/><br/>    properties = optional(list(object({<br/>      key           = string<br/>      value         = string<br/>      label         = optional(string)<br/>      display_value = optional(string)<br/>    })), [])<br/><br/>    auth_custom_header = optional(object({<br/>      key   = string<br/>      value = string<br/>    }))<br/><br/>    auth_token = optional(object({<br/>      prefix = string<br/>      token  = string<br/>    }))<br/><br/>    auth_basic = optional(object({<br/>      user     = string<br/>      password = string<br/>    }))<br/>  }))</pre> | `{}` | no |
| <a name="input_workflows"></a> [workflows](#input\_workflows) | Notification workflows. | <pre>map(object({<br/>    name                  = string<br/>    muting_rules_handling = string<br/><br/>    issues_filter = object({<br/>      name = string<br/>      type = optional(string)<br/><br/>      predicates = list(object({<br/>        attribute = string<br/>        operator  = string<br/>        values    = list(string)<br/>      }))<br/>    })<br/><br/>    notification_channels = map(object({<br/>      name = string<br/>      type = string<br/><br/>      destination_key = string<br/><br/>      properties = optional(list(object({<br/>        key           = string<br/>        value         = string<br/>        label         = optional(string)<br/>        display_value = optional(string)<br/>      })), [])<br/>    }))<br/>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_destination_ids"></a> [destination\_ids](#output\_destination\_ids) | Destination IDs |
| <a name="output_workflow_ids"></a> [workflow\_ids](#output\_workflow\_ids) | Workflow IDs |
<!-- END_TF_DOCS -->