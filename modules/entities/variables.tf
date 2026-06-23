variable "entities" {
  description = "Entity lookups keyed by logical name. Resolves entities created outside Terraform (e.g. APM applications) to their GUID and name for use in NRQL alert condition filters."

  type = map(object({
    name        = string
    type        = optional(string)
    domain      = optional(string)
    ignore_case = optional(bool)
    tags        = optional(map(string), {})
  }))

  default = {}
}
