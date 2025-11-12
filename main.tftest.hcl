variables {
  name       = "Test Alert Policy"
  account_id = 12345
}

run "defaults" {
  assert {
    condition     = module.alerts.alert_policy.incident_preference == "PER_POLICY"
    error_message = "NewRelic alert policy incident preference should default to PER_POLICY"
  }

  assert {
    condition     = module.alerts.alert_policy.name == "Test Alert Policy"
    error_message = "NewRelic alert policy name should match input"
  }

  assert {
    condition     = length(module.alerts.nrql_conditions) == 0
    error_message = "NewRelic NRQL conditions should be empty by default"
  }

  assert {
    condition     = module.alerts.workflow == null
    error_message = "NewRelic workflow should not be created when no notification channels exist"
  }
}

run "with_nrql_conditions" {
  variables {
    nrql_conditions = [
      {
        name        = "Test Condition"
        description = "Test NRQL condition"
        enabled     = true

        nrql = {
          query = "SELECT count(*) FROM Transaction"
        }

        critical = {
          operator              = "above"
          threshold             = 100
          threshold_duration    = 300
          threshold_occurrences = "ALL"
        }

        aggregation_window = 60
        aggregation_method = "event_flow"
      }
    ]
  }

  assert {
    condition     = length(module.alerts.nrql_conditions) == 1
    error_message = "Should create one NRQL condition"
  }

  assert {
    condition     = module.alerts.nrql_conditions[0].name == "Test Condition"
    error_message = "NRQL condition name should match input"
  }

  assert {
    condition     = module.alerts.nrql_conditions[0].enabled == true
    error_message = "NRQL condition should be enabled"
  }
}

run "with_notification_channels" {
  variables {
    notification_channels = [
      {
        name = "Email Channel"
        type = "EMAIL"

        config = {
          recipients = "test@example.com"
        }
      }
    ]
  }

  assert {
    condition     = module.alerts.workflow != null
    error_message = "Should create workflow when notification channels exist"
  }

  assert {
    condition     = module.alerts.workflow.enabled == true
    error_message = "Workflow should be enabled"
  }
}
