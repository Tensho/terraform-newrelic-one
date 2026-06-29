variable "api_access_keys" {
  description = "API access keys keyed by logical name. INGEST keys require `ingest_type`; USER keys require `user_id`. The provider does not infer `account_id` for this resource, so it is required per key."

  type = map(object({
    key_type    = string
    account_id  = number
    ingest_type = optional(string)
    user_id     = optional(number)
    name        = optional(string)
    notes       = optional(string)
  }))

  default = {}

  validation {
    condition = alltrue([
      for key in var.api_access_keys : contains(["INGEST", "USER"], key.key_type)
    ])
    error_message = "key_type must be either 'INGEST' or 'USER'."
  }

  validation {
    condition = alltrue([
      for key in var.api_access_keys : key.ingest_type == null ? true : contains(["BROWSER", "LICENSE"], key.ingest_type)
    ])
    error_message = "ingest_type must be either 'BROWSER' or 'LICENSE'."
  }

  validation {
    condition = alltrue([
      for key in var.api_access_keys : key.key_type != "INGEST" || key.ingest_type != null
    ])
    error_message = "ingest_type is required when key_type is 'INGEST'."
  }

  validation {
    condition = alltrue([
      for key in var.api_access_keys : key.key_type != "USER" || key.user_id != null
    ])
    error_message = "user_id is required when key_type is 'USER'."
  }
}
