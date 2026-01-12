variable "region" {
  description = "Region"
  type        = string

  validation {
    condition     = contains(["us01", "eu01"], var.region)
    error_message = "Region must be either 'us01' or 'eu01'."
  }
}

variable "name" {
  description = "Account name"
  type        = string
}
