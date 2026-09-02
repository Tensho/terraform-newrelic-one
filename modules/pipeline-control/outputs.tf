output "cloud_rules" {
  description = "Pipeline cloud rules keyed by logical name"

  value = newrelic_pipeline_cloud_rule.default
}
