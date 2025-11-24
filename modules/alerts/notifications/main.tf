resource "newrelic_notification_destination" "default" {
  for_each = var.destinations

  name = each.value.name
  type = each.value.type

  dynamic "secure_url" {
    for_each = each.value.secure_url != null ? [each.value.secure_url] : []

    content {
      prefix        = secure_url.value["prefix"]
      secure_suffix = secure_url.value["secure_suffix"]
    }
  }

  dynamic "property" {
    for_each = each.value.properties

    content {
      key           = property.value["key"]
      value         = property.value["value"]
      label         = property.value["label"]
      display_value = property.value["display_value"]
    }
  }

  dynamic "auth_custom_header" {
    for_each = each.value.auth_custom_header != null ? [each.value.auth_custom_header] : []

    content {
      key   = auth_custom_header.value["key"]
      value = auth_custom_header.value["value"]
    }
  }

  dynamic "auth_token" {
    for_each = each.value.auth_token != null ? [each.value.auth_token] : []

    content {
      prefix = auth_token.value["prefix"]
      token  = auth_token.value["token"]
    }
  }

  dynamic "auth_basic" {
    for_each = each.value.auth_basic != null ? [each.value.auth_basic] : []

    content {
      user     = auth_basic.value["user"]
      password = auth_basic.value["password"]
    }
  }
}

locals {
  notification_channels = merge([
    for workflow_key, workflow in var.workflows : {
      for notification_channel_key, notification_channel in workflow.notification_channels :
      "${workflow_key}/${notification_channel_key}" => merge(notification_channel, {
        workflow_key             = workflow_key
        notification_channel_key = notification_channel_key
      })
    }
  ]...)
}

resource "newrelic_notification_channel" "default" {
  for_each = local.notification_channels

  name = each.value.name
  type = each.value.type

  destination_id = newrelic_notification_destination.default[each.value.destination_key].id

  product = "IINT"

  dynamic "property" {
    for_each = each.value.properties

    content {
      key           = property.value["key"]
      value         = property.value["value"]
      label         = property.value["label"]
      display_value = property.value["display_value"]
    }
  }
}

resource "newrelic_workflow" "default" {
  for_each = var.workflows

  name = each.value.name

  muting_rules_handling = each.value.muting_rules_handling

  issues_filter {
    name = each.value.issues_filter.name
    type = each.value.issues_filter.type

    dynamic "predicate" {
      for_each = each.value.issues_filter.predicates

      content {
        attribute = predicate.value.attribute
        operator  = predicate.value.operator
        values    = predicate.value.values
      }
    }
  }

  dynamic "destination" {
    for_each = each.value.notification_channels

    content {
      channel_id = newrelic_notification_channel.default["${each.key}/${destination.value.destination_key}"].id
    }
  }
}