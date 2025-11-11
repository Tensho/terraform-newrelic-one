module "example" {
  source = "../../"

  name                = "Example Alert Policy"
  description         = "Example alert policy managed by Terraform"
  incident_preference = "PER_POLICY"

  nrql_conditions = [
    {
      name        = "High Error Rate"
      description = "Alert when error rate exceeds threshold"
      enabled     = true

      nrql = {
        query = "SELECT count(*) FROM TransactionError WHERE appName = 'Example App'"
      }

      critical = {
        operator              = "above"
        threshold             = 100
        threshold_duration    = 300
        threshold_occurrences = "ALL"
      }

      warning = {
        operator              = "above"
        threshold             = 50
        threshold_duration    = 300
        threshold_occurrences = "ALL"
      }

      fill_option        = "static"
      fill_value         = 0
      aggregation_window = 60
      aggregation_method = "event_flow"
      aggregation_delay  = 120
    },
    {
      name        = "High Response Time"
      description = "Alert when response time is too high"
      enabled     = true

      nrql = {
        query = "SELECT average(duration) FROM Transaction WHERE appName = 'Example App'"
      }

      critical = {
        operator              = "above"
        threshold             = 2.0
        threshold_duration    = 600
        threshold_occurrences = "ALL"
      }

      aggregation_window = 60
      aggregation_method = "event_flow"
    },
    {
      name        = "Low Throughput"
      description = "Alert when throughput drops below threshold"
      enabled     = true

      nrql = {
        query = "SELECT rate(count(*), 1 minute) FROM Transaction WHERE appName = 'Example App'"
      }

      critical = {
        operator              = "below"
        threshold             = 10
        threshold_duration    = 600
        threshold_occurrences = "ALL"
      }

      warning = {
        operator              = "below"
        threshold             = 20
        threshold_duration    = 300
        threshold_occurrences = "ALL"
      }

      aggregation_window = 60
      aggregation_method = "event_flow"
    }
  ]

  notification_channels = [
    {
      name = "Email Notifications"
      type = "EMAIL"

      config = {
        recipients              = "team@example.com"
        include_json_attachment = "false"
      }
    }
  ]
}

output "alert_policy_id" {
  value       = module.example.alert_policy_id
  description = "The ID of the created alert policy"
}

output "alert_policy" {
  value       = module.example.alert_policy
  description = "The created alert policy"
}
