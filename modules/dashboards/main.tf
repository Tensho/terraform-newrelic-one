resource "newrelic_one_dashboard_json" "default" {
  for_each = var.dashboards

  json = each.value
}