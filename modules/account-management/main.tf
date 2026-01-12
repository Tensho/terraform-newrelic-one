resource "newrelic_account_management" "default" {
  region = var.region
  name   = var.name
}