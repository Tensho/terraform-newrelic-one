output "alert_policy" {
  value       = newrelic_alert_policy.default
  description = "NewRelic alert policy."
}

output "alert_policy_id" {
  value       = newrelic_alert_policy.default.id
  description = "NewRelic alert policy ID."
}

output "nrql_conditions" {
  value       = newrelic_nrql_alert_condition.default
  description = "NewRelic NRQL alert conditions."
}

output "workflow" {
  value       = length(newrelic_workflow.default) > 0 ? newrelic_workflow.default[0] : null
  description = "NewRelic workflow."
}
