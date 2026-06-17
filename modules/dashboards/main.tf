resource "newrelic_one_dashboard_json" "default" {
  for_each = var.dashboards

  json = each.value.json
}

resource "newrelic_entity_tags" "default" {
  for_each = { for dashboard_key, dashboard in var.dashboards : dashboard_key => dashboard if length(dashboard.tags) > 0 }

  guid = newrelic_one_dashboard_json.default[each.key].guid

  dynamic "tag" {
    for_each = each.value.tags

    content {
      key    = tag.key
      values = tag.value
    }
  }
}