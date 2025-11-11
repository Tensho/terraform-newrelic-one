resource "newrelic_alert_policy" "default" {
  name                = var.name
  account_id          = var.account_id
  incident_preference = var.incident_preference
}

resource "newrelic_nrql_alert_condition" "default" {
  for_each = { for idx, condition in var.nrql_conditions : idx => condition }

  account_id                   = var.account_id
  policy_id                    = newrelic_alert_policy.default.id
  name                         = each.value.name
  description                  = each.value.description
  enabled                      = each.value.enabled
  violation_time_limit_seconds = each.value.violation_time_limit_seconds

  nrql {
    query = each.value.nrql.query
  }

  critical {
    operator              = each.value.critical.operator
    threshold             = each.value.critical.threshold
    threshold_duration    = each.value.critical.threshold_duration
    threshold_occurrences = each.value.critical.threshold_occurrences
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

  fill_option                    = each.value.fill_option
  fill_value                     = each.value.fill_value
  aggregation_window             = each.value.aggregation_window
  aggregation_method             = each.value.aggregation_method
  aggregation_delay              = each.value.aggregation_delay
  expiration_duration            = each.value.expiration_duration
  open_violation_on_expiration   = each.value.open_violation_on_expiration
  close_violations_on_expiration = each.value.close_violations_on_expiration
  slide_by                       = each.value.slide_by
}
