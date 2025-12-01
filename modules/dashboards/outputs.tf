output "dashboard_ids" {
  description = "Dashboard IDs"

  value = {
    for dashboard_key, dashboard in newrelic_one_dashboard_json.default : dashboard_key => dashboard.id
  }
}
