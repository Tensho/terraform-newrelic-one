variable "policies" {
  description = "Alert policies with NRQL conditions."

  type = map(object({
    name                = string
    description         = optional(string)
    incident_preference = optional(string)

    nrql_conditions = map(object({
      name        = string
      description = optional(string)
      enabled     = optional(bool, true)

      nrql = object({
        query = string
      })

      critical = optional(object({
        operator              = string
        threshold             = number
        threshold_duration    = number
        threshold_occurrences = string
      }))

      warning = optional(object({
        operator              = string
        threshold             = number
        threshold_duration    = number
        threshold_occurrences = string
      }))

      fill_option        = optional(string)
      fill_value         = optional(number)
      aggregation_window = optional(number)
      aggregation_method = optional(string)
      aggregation_delay  = optional(number)
      type               = optional(string, "static")
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
