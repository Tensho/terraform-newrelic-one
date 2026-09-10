output "rules" {
  description = "Events to metrics rules keyed by logical name"

  value = newrelic_events_to_metrics_rule.default
}
