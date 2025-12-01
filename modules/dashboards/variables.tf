variable "dashboards" {
  description = "Dashboards"

  type = map(string)

  default = {}

  validation {
    condition     = alltrue([for v in values(var.dashboards) : can(jsondecode(v))])
    error_message = "All dashboard values must be valid JSON strings."
  }
}
