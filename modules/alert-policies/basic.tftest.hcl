run "basic" {
  variables {
    policies = {
      "test-one" = {
        name                = "Test One"
        description         = "Test One alert policy managed by Terraform"
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
      "test-two" = {
        name        = "Test Two"
        description = "Test Two alert policy managed by Terraform"

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
    condition     = length(newrelic_alert_policy.default["test-one"]) > 0
    error_message = "Alert policy 'test-one' has not been created"
  }

  assert {
    condition     = length(newrelic_alert_policy.default["test-two"]) > 0
    error_message = "Alert policy 'test-two' has not been created"
  }

  assert {
    condition     = length(newrelic_nrql_alert_condition.default["test-one/all-attributes"]) > 0
    error_message = "Alert policy 'test-one/all-attributes' has not been created"
  }

  assert {
    condition     = length(newrelic_nrql_alert_condition.default["test-one/required-attributes"]) > 0
    error_message = "Alert policy 'test-one/required-attributes' has not been created"
  }

  assert {
    condition     = length(newrelic_nrql_alert_condition.default["test-two/required-attributes"]) > 0
    error_message = "Alert policy 'test-two/required-attributes' has not been created"
  }
}

run "missing_terms" {
  command = plan

  variables {
    policies = {
      "test-three" = {
        name = "Test Three"

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
