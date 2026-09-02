variable "cloud_rules" {
  description = "Pipeline cloud rules keyed by logical name. Each rule drops matching data at ingest with a `DELETE FROM` NRQL statement. `account_id` defaults to the provider account. Pipeline cloud rules replace the end-of-life `newrelic_nrql_drop_rule` resource."

  type = map(object({
    name        = string
    nrql        = string
    description = optional(string)
    account_id  = optional(number)
  }))

  default = {}

  validation {
    condition = alltrue([
      for rule in var.cloud_rules : can(regex("^\\s*(?i:DELETE)\\s+FROM\\s+", rule.nrql))
    ])
    error_message = "nrql must be a drop statement starting with 'DELETE FROM'."
  }
}
