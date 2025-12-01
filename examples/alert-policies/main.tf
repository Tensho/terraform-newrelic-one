module "example" {
  source = "../../modules/alert-policies"

  policies = {
    "Example" = {
      name                = "Example"
      description         = "Example alert policy managed by Terraform"
      incident_preference = "PER_POLICY"

      nrql_conditions = {
        "high-error-rate" = {
          name        = "High Error Rate"
          description = "Alice has high error rate"
          enabled     = true

          nrql = {
            query = "SELECT count(*) FROM TransactionError"
          }

          critical = {
            operator              = "above"
            threshold             = 42
            threshold_duration    = 600
            threshold_occurrences = "ALL"
          }

          warning = {
            operator              = "above_or_equals"
            threshold             = 42
            threshold_duration    = 300
            threshold_occurrences = "AT_LEAST_ONCE"
          }

          fill_option = "static"
          fill_value  = 0

          aggregation_window = 60
          aggregation_method = "event_flow"
          aggregation_delay  = 120
        },
        "high-response-time" = {
          name        = "High Response Time"
          description = "Alice has high response time"

          nrql = {
            query = "SELECT average(duration) FROM Transaction"
          }

          critical = {
            operator              = "above_or_equals"
            threshold             = 42
            threshold_duration    = 600
            threshold_occurrences = "ALL"
          }
        }
      }
    }
  }
}
