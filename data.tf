data "newrelic_account" "default" {
  count = var.account_id != null ? 0 : 1
  scope = "GLOBAL"
}
