run "basic" {
  variables {
    dashboards = {
      "test" = templatefile("dashboard.json.tftpl", {
        account_id = 1234567

        applications = [
          {
            name    = "Test One",
            appName = "app1",
          },
          {
            name    = "Test Two",
            appName = "app2",
          },
        ]
      })

      "best" = templatefile("dashboard.json.tftpl", {
        account_id = 7654321

        applications = [
          {
            name    = "Best One",
            appName = "app1",
          },
          {
            name    = "Best Two",
            appName = "app2",
          },
        ]
      })
    }
  }

  assert {
    condition     = length(newrelic_one_dashboard_json.default["test"]) > 0
    error_message = "Dashboard 'Test' has not been created"
  }

  assert {
    condition     = length(newrelic_one_dashboard_json.default["best"]) > 0
    error_message = "Dashboard 'Best' has not been created"
  }
}
