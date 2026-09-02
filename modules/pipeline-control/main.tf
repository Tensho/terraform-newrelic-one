resource "newrelic_pipeline_cloud_rule" "default" {
  for_each = var.cloud_rules

  account_id = each.value.account_id

  name        = each.value.name
  description = each.value.description
  nrql        = each.value.nrql
}
