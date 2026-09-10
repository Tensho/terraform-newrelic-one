run "basic" {
  variables {
    rules = {
      "transaction-duration" = {
        name        = "Test Transaction Duration"
        description = "Test events to metrics rule managed by Terraform"
        account_id  = 7479170
        nrql        = "SELECT summary(duration) AS `test.transaction.duration` FROM Transaction FACET appName"
        enabled     = true
      }

      "transaction-hosts" = {
        name        = "Test Transaction Hosts"
        description = "Test events to metrics rule managed by Terraform"
        account_id  = 7479170
        nrql        = "SELECT uniqueCount(host) AS `test.transaction.hostCount` FROM Transaction FACET appName"
      }
    }
  }

  assert {
    condition     = newrelic_events_to_metrics_rule.default["transaction-duration"].rule_id != ""
    error_message = "Events to metrics rule 'transaction-duration' has not been created"
  }

  assert {
    condition     = newrelic_events_to_metrics_rule.default["transaction-duration"].enabled
    error_message = "Events to metrics rule 'transaction-duration' should be enabled"
  }

  assert {
    condition     = newrelic_events_to_metrics_rule.default["transaction-hosts"].rule_id != ""
    error_message = "Events to metrics rule 'transaction-hosts' has not been created"
  }
}
