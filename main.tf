module "alerts" {
  source = "./modules/alerts"

  name                  = var.name
  description           = var.description
  account_id            = var.account_id
  incident_preference   = var.incident_preference
  nrql_conditions       = var.nrql_conditions
  notification_channels = var.notification_channels
}
