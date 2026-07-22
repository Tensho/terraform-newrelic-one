variable "policies" {
  description = "Alert policies with NRQL conditions."

  type = map(object({
    name                = string
    incident_preference = optional(string)

    tags = optional(map(list(string)), {})

    nrql_conditions = map(object({
      name        = string
      description = optional(string)
      enabled     = optional(bool, true)

      title_template = optional(string)
      runbook_url    = optional(string)

      tags = optional(map(list(string)), {})

      nrql = object({
        query           = string
        data_account_id = optional(number)
      })

      critical = optional(object({
        operator                        = string
        threshold                       = number
        threshold_duration              = number
        threshold_occurrences           = string
        disable_health_status_reporting = optional(bool)
      }))

      warning = optional(object({
        operator                        = string
        threshold                       = number
        threshold_duration              = number
        threshold_occurrences           = string
        disable_health_status_reporting = optional(bool)
      }))

      fill_option        = optional(string)
      fill_value         = optional(number)
      aggregation_window = optional(number)
      aggregation_method = optional(string)
      aggregation_delay  = optional(number)
      aggregation_timer  = optional(number)
      evaluation_delay   = optional(number)
      slide_by           = optional(number)

      type = optional(string, "static")

      baseline_direction = optional(string)
      signal_seasonality = optional(string)

      expiration_duration            = optional(number)
      open_violation_on_expiration   = optional(bool)
      close_violations_on_expiration = optional(bool)
      ignore_on_expected_termination = optional(bool)
      violation_time_limit_seconds   = optional(number)
    }))
  }))

  default = {}

  validation {
    condition = alltrue([
      for policy_key, policy in var.policies : alltrue([
        for condition_key, condition in policy.nrql_conditions :
        condition.critical != null || condition.warning != null
      ])
    ])
    error_message = "NRQL condition must have at least one of 'critical' or 'warning' defined."
  }
}
