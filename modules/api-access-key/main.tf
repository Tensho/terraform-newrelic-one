resource "newrelic_api_access_key" "default" {
  for_each = var.api_access_keys

  account_id = each.value.account_id

  key_type    = each.value.key_type
  ingest_type = each.value.ingest_type
  user_id     = each.value.user_id
  name        = each.value.name
  notes       = each.value.notes
}
