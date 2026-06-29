output "api_access_keys" {
  description = "API access key values keyed by logical name"

  value     = { for name, key in newrelic_api_access_key.default : name => key.key }
  sensitive = true
}
