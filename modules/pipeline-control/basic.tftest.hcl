run "basic" {
  variables {
    cloud_rules = {
      "debug-logs" = {
        name        = "Test Drop Debug Logs"
        description = "Test pipeline cloud rule managed by Terraform"
        nrql        = "DELETE FROM Log WHERE logLevel = 'DEBUG' AND environment = 'test'"
      }
    }
  }

  assert {
    condition     = newrelic_pipeline_cloud_rule.default["debug-logs"].id != ""
    error_message = "Pipeline cloud rule 'debug-logs' has not been created"
  }

  assert {
    condition     = newrelic_pipeline_cloud_rule.default["debug-logs"].account_id != 0
    error_message = "Pipeline cloud rule 'debug-logs' should inherit the provider account"
  }
}
