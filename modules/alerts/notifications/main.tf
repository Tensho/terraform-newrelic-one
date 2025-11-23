resource "newrelic_notification_destination" "default" {
  for_each = var.destinations

  name = each.value.name
  type = each.value.type

  dynamic "secure_url" {
    for_each = each.value.secure_url != null ? [each.value.secure_url] : []

    content {
      prefix        = secure_url.value.prefix
      secure_suffix = secure_url.value.secure_suffix
    }
  }

  dynamic "property" {
    for_each = each.value.properties

    content {
      key           = property.value.key
      value         = property.value.value
      label         = property.value.label
      display_value = property.value.display_value
    }
  }

  dynamic "auth_custom_header" {
    for_each = each.value.auth_custom_header != null ? [each.value.auth_custom_header] : []

    content {
      key   = auth_custom_header.value.key
      value = auth_custom_header.value.value
    }
  }

  dynamic "auth_token" {
    for_each = each.value.auth_token != null ? [each.value.auth_token] : []

    content {
      prefix = auth_token.value.prefix
      token  = auth_token.value.token
    }
  }

  dynamic "auth_basic" {
    for_each = each.value.auth_basic != null ? [each.value.auth_basic] : []

    content {
      user     = auth_basic.value.user
      password = auth_basic.value.password
    }
  }
}


