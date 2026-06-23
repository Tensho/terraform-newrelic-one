run "setup" {
  module {
    source = "../synthetic-monitors"
  }

  variables {
    synthetic_monitors = {
      simple = {
        "test" = {
          name             = "Test"
          status           = "DISABLED"
          period           = "EVERY_MINUTE"
          uri              = "https://example.com"
          locations_public = ["US_EAST_1"]
        }
      }
    }
  }
}

run "wait" {
  module {
    source = "../../tests/wait"
  }
}

run "basic" {
  variables {
    entities = {
      "synthetic" = {
        name   = "Test"
        type   = "MONITOR"
        domain = "SYNTH"
      }
    }
  }

  assert {
    condition     = data.newrelic_entity.default["synthetic"].name == "Test"
    error_message = "Synthetics monitor entity should be resolved by the data source"
  }

  assert {
    condition     = data.newrelic_entity.default["synthetic"].guid != ""
    error_message = "Resolved entity should expose a GUID"
  }
}
