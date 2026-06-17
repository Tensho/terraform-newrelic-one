run "basic" {
  variables {
    dashboards = {
      "test" = {
        json = templatefile("dashboard.json.tftpl", {
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

        tags = {
          environment = ["test"]
          team        = ["platform", "sre"]
        }
      }

      "best" = {
        json = templatefile("dashboard.json.tftpl", {
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

        tags = {
          environment = ["test"]
        }
      }
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

  assert {
    condition     = length(newrelic_entity_tags.default["test"]) > 0
    error_message = "Tags for dashboard 'test' have not been created"
  }

  assert {
    condition     = length(newrelic_entity_tags.default["best"]) > 0
    error_message = "Tags for dashboard 'best' have not been created"
  }
}
