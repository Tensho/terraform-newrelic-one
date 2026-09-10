variable "rules" {
  description = "Events to metrics rules keyed by logical name. Each rule turns matching events into metrics with a `SELECT` NRQL statement, where every aggregated value is aliased to the target metric name. The API accepts only the `summary`, `uniqueCount`, and `distribution` query functions. The provider does not infer `account_id` for this resource, so it is required per rule. `name`, `nrql`, and `description` are immutable, so changing them replaces the rule."

  type = map(object({
    name        = string
    nrql        = string
    account_id  = number
    description = optional(string)
    enabled     = optional(bool)
  }))

  default = {}

  validation {
    condition = alltrue([
      for rule in var.rules : can(regex("^\\s*(?i:SELECT)\\s+", rule.nrql))
    ])
    error_message = "nrql must be a query statement starting with 'SELECT'."
  }

  validation {
    condition = alltrue([
      for rule in var.rules : can(regex("(?i:summary|uniqueCount|distribution)\\s*\\(", rule.nrql))
    ])
    error_message = "nrql must aggregate with one of the 'summary', 'uniqueCount', or 'distribution' query functions."
  }
}
