resource "newrelic_synthetics_monitor" "simple" {
  for_each = try(var.synthetics_monitors.simple, {})

  name             = each.value.name
  type             = "SIMPLE"
  status           = each.value.status
  period           = each.value.period
  uri              = each.value.uri
  locations_public = each.value.locations_public

  validation_string = each.value.validation_string
  verify_ssl        = each.value.verify_ssl

  treat_redirect_as_failure = each.value.treat_redirect_as_failure
  bypass_head_request       = each.value.bypass_head_request

  dynamic "custom_header" {
    for_each = each.value.custom_header
    content {
      name  = custom_header.value.name
      value = custom_header.value.value
    }
  }

  dynamic "tag" {
    for_each = each.value.tag
    content {
      key    = tag.value.key
      values = tag.value.values
    }
  }
}

resource "newrelic_synthetics_monitor" "browser" {
  for_each = try(var.synthetics_monitors.browser, {})

  name             = each.value.name
  type             = "BROWSER"
  status           = each.value.status
  period           = each.value.period
  uri              = each.value.uri
  locations_public = each.value.locations_public

  validation_string = each.value.validation_string
  verify_ssl        = each.value.verify_ssl

  enable_screenshot_on_failure_and_script = each.value.enable_screenshot_on_failure_and_script
  runtime_type_version                    = each.value.runtime_type_version
  runtime_type                            = each.value.runtime_type
  script_language                         = each.value.script_language

  dynamic "custom_header" {
    for_each = each.value.custom_header
    content {
      name  = custom_header.value.name
      value = custom_header.value.value
    }
  }

  dynamic "tag" {
    for_each = each.value.tag
    content {
      key    = tag.value.key
      values = tag.value.values
    }
  }
}

resource "newrelic_synthetics_broken_links_monitor" "default" {
  for_each = try(var.synthetics_monitors.broken_links, {})

  name             = each.value.name
  status           = each.value.status
  period           = each.value.period
  uri              = each.value.uri
  locations_public = each.value.locations_public

  runtime_type         = each.value.runtime_type
  runtime_type_version = each.value.runtime_type_version

  dynamic "tag" {
    for_each = each.value.tag
    content {
      key    = tag.value.key
      values = tag.value.values
    }
  }
}

resource "newrelic_synthetics_script_monitor" "script_browser" {
  for_each = try(var.synthetics_monitors.script_browser, {})

  name             = each.value.name
  type             = "SCRIPT_BROWSER"
  status           = each.value.status
  period           = each.value.period
  locations_public = each.value.locations_public

  enable_screenshot_on_failure_and_script = each.value.enable_screenshot_on_failure_and_script
  runtime_type_version                    = each.value.runtime_type_version
  runtime_type                            = each.value.runtime_type
  script_language                         = each.value.script_language
  script                                  = each.value.script
  devices                                 = each.value.devices

  dynamic "tag" {
    for_each = each.value.tag
    content {
      key    = tag.value.key
      values = tag.value.values
    }
  }
}

resource "newrelic_synthetics_script_monitor" "script_api" {
  for_each = try(var.synthetics_monitors.script_api, {})

  name             = each.value.name
  type             = "SCRIPT_API"
  status           = each.value.status
  period           = each.value.period
  locations_public = each.value.locations_public

  runtime_type_version = each.value.runtime_type_version
  runtime_type         = each.value.runtime_type
  script_language      = each.value.script_language
  script               = each.value.script

  dynamic "tag" {
    for_each = each.value.tag
    content {
      key    = tag.value.key
      values = tag.value.values
    }
  }
}

resource "newrelic_synthetics_cert_check_monitor" "default" {
  for_each = try(var.synthetics_monitors.cert_check, {})

  name                   = each.value.name
  status                 = each.value.status
  period                 = each.value.period
  domain                 = each.value.domain
  locations_public       = each.value.locations_public
  certificate_expiration = each.value.certificate_expiration

  runtime_type         = each.value.runtime_type
  runtime_type_version = each.value.runtime_type_version

  dynamic "tag" {
    for_each = each.value.tag
    content {
      key    = tag.value.key
      values = tag.value.values
    }
  }
}

resource "newrelic_synthetics_step_monitor" "default" {
  for_each = try(var.synthetics_monitors.step_monitor, {})

  name                                    = each.value.name
  status                                  = each.value.status
  period                                  = each.value.period
  locations_public                        = each.value.locations_public
  enable_screenshot_on_failure_and_script = each.value.enable_screenshot_on_failure_and_script
  runtime_type                            = each.value.runtime_type
  runtime_type_version                    = each.value.runtime_type_version

  dynamic "steps" {
    for_each = each.value.steps

    content {
      ordinal = steps.value.ordinal
      type    = steps.value.type
      values  = steps.value.values
    }
  }

  dynamic "tag" {
    for_each = each.value.tag
    content {
      key    = tag.value.key
      values = tag.value.values
    }
  }
}

