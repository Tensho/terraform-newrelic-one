variable "synthetics_monitors" {
  description = "Synthetics monitors by type (simple, browser, broken_links, script_browser, script_api, cert_check, step_monitor, etc.)"

  type = map(map(object({
    name   = string
    status = string
    period = string

    locations_public  = list(string)
    locations_private = optional(list(string), [])

    uri                                     = optional(string, null)
    domain                                  = optional(string, null)
    certificate_expiration                  = optional(number, null)
    validation_string                       = optional(string, null)
    verify_ssl                              = optional(bool, false)
    treat_redirect_as_failure               = optional(bool, false)
    bypass_head_request                     = optional(bool, false)
    enable_screenshot_on_failure_and_script = optional(bool, null)
    runtime_type_version                    = optional(string, null)
    runtime_type                            = optional(string, null)
    script_language                         = optional(string, null)
    script                                  = optional(string, null)
    devices                                 = optional(list(string), null)
    browsers                                = optional(list(string), null)

    steps = optional(list(object({
      ordinal = number
      type    = string
      values  = optional(list(string), null)
    })), [])

    custom_header = optional(list(object({
      name  = string
      value = string
    })), [])

    tag = optional(list(object({
      key    = string
      values = list(string)
    })), [])
  })))

  default = {}
}
