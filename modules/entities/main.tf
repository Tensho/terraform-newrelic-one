data "newrelic_entity" "default" {
  for_each = var.entities

  name        = each.value.name
  type        = each.value.type
  domain      = each.value.domain
  ignore_case = each.value.ignore_case

  dynamic "tag" {
    for_each = each.value.tags

    content {
      key   = tag.key
      value = tag.value
    }
  }
}
