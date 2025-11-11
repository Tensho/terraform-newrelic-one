variable "name" {
  description = "NewRelic alert policy name"
  type        = string
}

variable "description" {
  description = "NewRelic alert policy description."
  type        = string
  default     = "Managed by Terraform"
}

variable "account_id" {
  description = "NewRelic account ID."
  type        = number
  default     = null
}

variable "incident_preference" {
  description = "NewRelic alert policy incident rollup preference."
  type        = string
  default     = "PER_POLICY"

  validation {
    condition     = contains(["PER_POLICY", "PER_CONDITION", "PER_CONDITION_AND_TARGET"], var.incident_preference)
    error_message = "Incident preference must be one of: PER_POLICY, PER_CONDITION, PER_CONDITION_AND_TARGET"
  }
}

variable "nrql_conditions" {
  description = "NewRelic NRQL alert conditions."

  type = list(object({
    name                         = string
    description                  = optional(string)
    enabled                      = optional(bool, true)
    violation_time_limit_seconds = optional(number)

    nrql = object({
      query = string
    })

    critical = object({
      operator              = string
      threshold             = number
      threshold_duration    = number
      threshold_occurrences = optional(string, "ALL")
    })

    warning = optional(object({
      operator              = string
      threshold             = number
      threshold_duration    = number
      threshold_occurrences = optional(string, "ALL")
    }))

    fill_option                    = optional(string)
    fill_value                     = optional(number)
    aggregation_window             = optional(number)
    aggregation_method             = optional(string)
    aggregation_delay              = optional(number)
    expiration_duration            = optional(number)
    open_violation_on_expiration   = optional(bool)
    close_violations_on_expiration = optional(bool)
    slide_by                       = optional(number)
  }))

  default = []
}

variable "notification_channels" {
  description = "NewRelic notification channel configurations."

  type = list(object({
    name = string
    type = string

    config = object({
      recipients              = optional(string)
      include_json_attachment = optional(string)
      channel                 = optional(string)
      url                     = optional(string)
      tags                    = optional(string)
      api_key                 = optional(string)
      teams                   = optional(string)
      team_channel            = optional(string)
      service_key             = optional(string)
      route_key               = optional(string)
    })
  }))

  default = []
}
