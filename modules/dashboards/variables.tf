variable "dashboards" {
  description = "Dashboards"

  type = map(object({
    json = string

    tags = optional(map(list(string)), {})
  }))

  default = {}

  validation {
    condition     = alltrue([for v in values(var.dashboards) : can(jsondecode(v.json))])
    error_message = "All dashboard values must be valid JSON strings."
  }
}
