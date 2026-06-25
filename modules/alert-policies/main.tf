resource "newrelic_alert_policy" "default" {
  for_each = var.policies

  name                = each.value.name
  incident_preference = each.value.incident_preference
}

resource "newrelic_entity_tags" "policy" {
  for_each = { for policy_key, policy in var.policies : policy_key => policy if length(policy.tags) > 0 }

  guid = newrelic_alert_policy.default[each.key].entity_guid

  dynamic "tag" {
    for_each = each.value.tags

    content {
      key    = tag.key
      values = tag.value
    }
  }
}

locals {
  conditions = merge([
    for policy_key, policy in var.policies : {
      for condition_key, condition in policy.nrql_conditions :
      "${policy_key}/${condition_key}" => merge(condition, {
        policy_key    = policy_key
        condition_key = condition_key
      })
    }
  ]...)
}

resource "newrelic_nrql_alert_condition" "default" {
  for_each = local.conditions

  policy_id = tonumber(newrelic_alert_policy.default[each.value.policy_key].id)

  type = each.value.type

  baseline_direction = each.value.baseline_direction

  name        = each.value.name
  description = each.value.description
  enabled     = each.value.enabled

  title_template = each.value.title_template
  runbook_url    = each.value.runbook_url

  nrql {
    query = each.value.nrql.query
  }

  dynamic "critical" {
    for_each = each.value.critical != null ? [each.value.critical] : []

    content {
      operator              = critical.value.operator
      threshold             = critical.value.threshold
      threshold_duration    = critical.value.threshold_duration
      threshold_occurrences = critical.value.threshold_occurrences
    }
  }

  dynamic "warning" {
    for_each = each.value.warning != null ? [each.value.warning] : []

    content {
      operator              = warning.value.operator
      threshold             = warning.value.threshold
      threshold_duration    = warning.value.threshold_duration
      threshold_occurrences = warning.value.threshold_occurrences
    }
  }

  fill_option        = each.value.fill_option
  fill_value         = each.value.fill_value
  aggregation_window = each.value.aggregation_window
  aggregation_method = each.value.aggregation_method
  aggregation_delay  = each.value.aggregation_delay

  expiration_duration            = each.value.expiration_duration
  close_violations_on_expiration = each.value.close_violations_on_expiration
  ignore_on_expected_termination = each.value.ignore_on_expected_termination
  violation_time_limit_seconds   = each.value.violation_time_limit_seconds
}

resource "newrelic_entity_tags" "condition" {
  for_each = { for condition_key, condition in local.conditions : condition_key => condition if length(condition.tags) > 0 }

  guid = newrelic_nrql_alert_condition.default[each.key].entity_guid

  dynamic "tag" {
    for_each = each.value.tags

    content {
      key    = tag.key
      values = tag.value
    }
  }
}
