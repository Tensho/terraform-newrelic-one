run "basic" {
  variables {
    policies = {
      "example-one" = {
        name                = "Example One"
        description         = "Example One alert policy managed by Terraform"
        incident_preference = "PER_POLICY"

        nrql_conditions = {
          "all-attributes" = {
            name        = "All Attributes"
            description = "Alert condition with all attributes"
            enabled     = true

            nrql = {
              query = "SELECT count(*) FROM TransactionError"
            }

            critical = {
              operator              = "above"
              threshold             = 42
              threshold_duration    = 300
              threshold_occurrences = "ALL"
            }

            warning = {
              operator              = "above_or_equals"
              threshold             = 42
              threshold_duration    = 600
              threshold_occurrences = "AT_LEAST_ONCE"
            }

            fill_option        = "static"
            fill_value         = 0
            aggregation_window = 60
            aggregation_method = "event_flow"
            aggregation_delay  = 120
          },
          "required-attributes" = {
            name = "Required Attributes"

            nrql = {
              query = "SELECT count(*) FROM TransactionError"
            }

            critical = {
              operator              = "below"
              threshold             = 42
              threshold_duration    = 300
              threshold_occurrences = "ALL"
            }
          },
        }
      }
      "example-two" = {
        name        = "Example Two"
        description = "Example Two alert policy managed by Terraform"

        nrql_conditions = {
          "required-attributes" = {
            name = "Required Attributes"

            nrql = {
              query = "SELECT count(*) FROM TransactionError"
            }

            critical = {
              operator              = "below"
              threshold             = 42
              threshold_duration    = 300
              threshold_occurrences = "ALL"
            }
          }
        }
      }
    }
  }

  assert {
    condition     = length(newrelic_alert_policy.default["example-one"]) > 0
    error_message = "Alert policy 'example-one' has not been created"
  }

  assert {
    condition     = length(newrelic_alert_policy.default["example-two"]) > 0
    error_message = "Alert policy 'example-two' has not been created"
  }

  assert {
    condition     = length(newrelic_nrql_alert_condition.default["example-one/all-attributes"]) > 0
    error_message = "Alert policy 'example-one/all-attributes' has not been created"
  }

  assert {
    condition     = length(newrelic_nrql_alert_condition.default["example-one/required-attributes"]) > 0
    error_message = "Alert policy 'example-one/required-attributes' has not been created"
  }

  assert {
    condition     = length(newrelic_nrql_alert_condition.default["example-two/required-attributes"]) > 0
    error_message = "Alert policy 'example-two/required-attributes' has not been created"
  }
}

run "missing_terms" {
  command = plan

  variables {
    policies = {
      "example-three" = {
        name = "Example Three"

        nrql_conditions = {
          "missing-terms" = {
            name = "Missing Terms"

            nrql = {
              query = "SELECT count(*) FROM TransactionError"
            }

            # critical = {
            #   operator              = "above"
            #   threshold             = 42
            #   threshold_duration    = 600
            #   threshold_occurrences = "ALL"
            # }
            #
            # warning = {
            #   operator              = "above"
            #   threshold             = 42
            #   threshold_duration    = 300
            #   threshold_occurrences = "ALL"
            # }
          }
        }
      }
    }
  }

  expect_failures = [
    var.policies,
  ]
}
