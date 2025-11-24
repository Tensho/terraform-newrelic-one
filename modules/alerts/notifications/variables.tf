variable "destinations" {
  description = "Notification destinations."

  type = map(object({
    name = string
    type = string

    secure_url = optional(object({
      prefix        = string
      secure_suffix = string
    }))

    properties = optional(list(object({
      key           = string
      value         = string
      label         = optional(string)
      display_value = optional(string)
    })), [])

    auth_custom_header = optional(object({
      key   = string
      value = string
    }))

    auth_token = optional(object({
      prefix = string
      token  = string
    }))

    auth_basic = optional(object({
      user     = string
      password = string
    }))
  }))

  default = {}
}

variable "workflows" {
  description = "Notification workflows."

  type = map(object({
    name                  = string
    muting_rules_handling = string

    issues_filter = object({
      name = string
      type = optional(string)

      predicates = list(object({
        attribute = string
        operator  = string
        values    = list(string)
      }))
    })

    notification_channels = map(object({
      name = string
      type = string

      destination_key = string

      properties = optional(list(object({
        key           = string
        value         = string
        label         = optional(string)
        display_value = optional(string)
      })), [])
    }))
  }))

  default = {}
}
