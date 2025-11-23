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


