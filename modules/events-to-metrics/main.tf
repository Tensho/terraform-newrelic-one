resource "newrelic_events_to_metrics_rule" "default" {
  for_each = var.rules

  account_id = each.value.account_id

  name        = each.value.name
  description = each.value.description
  nrql        = each.value.nrql
  enabled     = each.value.enabled
}
