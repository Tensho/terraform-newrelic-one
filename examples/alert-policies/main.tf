# tflint-ignore: terraform_required_version
module "example" {
  source = "../../modules/alert-policies"

  policies = {
    "Example" = {
      name                = "Example"
      description         = "Example alert policy managed by Terraform"
      incident_preference = "PER_POLICY"

      tags = {
        environment = ["production"]
        team        = ["platform", "sre"]
      }

      nrql_conditions = {
        "all-attributes" = {
          name        = "All Attributes"
          description = "Alert condition with all attributes"
          enabled     = true

          type = "baseline"

          baseline_direction = "upper_only"

          title_template = "All Attributes"
          runbook_url    = "https://example.com/runbooks/all-attributes"

          tags = {
            team = ["sre"]
          }

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
            operator              = "above"
            threshold             = 42
            threshold_duration    = 300
            threshold_occurrences = "AT_LEAST_ONCE"
          }

          fill_option = "static"
          fill_value  = 0

          aggregation_window = 60
          aggregation_method = "event_flow"
          aggregation_delay  = 120

          expiration_duration            = 120
          close_violations_on_expiration = true
          ignore_on_expected_termination = true
          violation_time_limit_seconds   = 86400
        },
        "required-attributes" = {
          name = "Required Attributes"

          nrql = {
            query = "SELECT count(*) FROM TransactionError"
          }

          critical = {
            operator              = "above"
            threshold             = 42
            threshold_duration    = 600
            threshold_occurrences = "ALL"
          }
        }
      }
    }
  }
}
