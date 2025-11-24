resource "newrelic_alert_policy" "default" {
  for_each = var.policies

  name                = each.value.name
  incident_preference = each.value.incident_preference
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

  type        = each.value.type
  name        = each.value.name
  description = each.value.description
  enabled     = each.value.enabled

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
}
