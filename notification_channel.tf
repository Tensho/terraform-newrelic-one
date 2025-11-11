resource "newrelic_notification_channel" "default" {
  for_each = { for idx, channel in var.notification_channels : idx => channel }

  account_id = var.account_id
  name       = each.value.name
  type       = each.value.type

  destination_id = newrelic_notification_destination.default[each.key].id
  product        = "IINT"

  property {
    key   = "subject"
    value = "{{ issueTitle }}"
  }
}

resource "newrelic_notification_destination" "default" {
  for_each = { for idx, channel in var.notification_channels : idx => channel }

  account_id = var.account_id
  name       = each.value.name
  type       = each.value.type

  dynamic "property" {
    for_each = each.value.config.recipients != null ? [1] : []
    content {
      key   = "recipients"
      value = each.value.config.recipients
    }
  }

  dynamic "property" {
    for_each = each.value.config.channel != null ? [1] : []
    content {
      key   = "channel"
      value = each.value.config.channel
    }
  }

  dynamic "property" {
    for_each = each.value.config.url != null ? [1] : []
    content {
      key   = "url"
      value = each.value.config.url
    }
  }

  dynamic "property" {
    for_each = each.value.config.api_key != null ? [1] : []
    content {
      key   = "apiKey"
      value = each.value.config.api_key
    }
  }

  dynamic "property" {
    for_each = each.value.config.route_key != null ? [1] : []
    content {
      key   = "routingKey"
      value = each.value.config.route_key
    }
  }
}

resource "newrelic_workflow" "default" {
  count = length(var.notification_channels) > 0 ? 1 : 0

  account_id            = var.account_id
  name                  = "${var.name} Workflow"
  enabled               = true
  muting_rules_handling = "NOTIFY_ALL_ISSUES"

  issues_filter {
    name = "Filter by policy"
    type = "FILTER"

    predicate {
      attribute = "labels.policyIds"
      operator  = "EXACTLY_MATCHES"
      values    = [newrelic_alert_policy.default.id]
    }
  }

  dynamic "destination" {
    for_each = { for idx, channel in var.notification_channels : idx => channel }

    content {
      channel_id = newrelic_notification_channel.default[destination.key].id
    }
  }
}
