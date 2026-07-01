run "basic" {
  variables {
    synthetic_monitors = {
      simple = {
        "test" = {
          name             = "Simple Test"
          status           = "ENABLED"
          period           = "EVERY_MINUTE"
          uri              = "https://test.com"
          locations_public = ["US_EAST_1", "US_WEST_1"]

          validation_string = "success"
          verify_ssl        = true

          treat_redirect_as_failure = false
          bypass_head_request       = false

          custom_header = [
            {
              name  = "X-Custom-Header"
              value = "test"
            }
          ]

          tags = {
            environment = ["test"]
            team        = ["platform", "sre"]
          }
        }
      }

      browser = {
        "test" = {
          name             = "Browser Test"
          status           = "ENABLED"
          period           = "EVERY_5_MINUTES"
          uri              = "https://test.com"
          locations_public = ["US_EAST_1", "US_WEST_1"]

          validation_string = "success"
          verify_ssl        = true

          enable_screenshot_on_failure_and_script = true
          runtime_type_version                    = "100"
          runtime_type                            = "CHROME_BROWSER"
          script_language                         = "JAVASCRIPT"
          devices                                 = ["DESKTOP", "TABLET_LANDSCAPE", "MOBILE_PORTRAIT"]
          browsers                                = ["CHROME"]

          custom_header = [
            {
              name  = "X-Custom-Header"
              value = "test"
            }
          ]

          tags = {
            environment = ["test"]
            team        = ["platform", "sre"]
          }
        }
      }

      broken_links = {
        "test" = {
          name             = "Broken Links Test"
          status           = "ENABLED"
          period           = "EVERY_10_MINUTES"
          uri              = "https://test.com"
          locations_public = ["US_EAST_1", "US_WEST_1"]

          runtime_type         = "NODE_API"
          runtime_type_version = "16.10"

          tags = {
            environment = ["test"]
            team        = ["platform", "sre"]
          }
        }
      }

      script_browser = {
        "test" = {
          name             = "Script Browser Test"
          status           = "ENABLED"
          period           = "EVERY_15_MINUTES"
          locations_public = ["US_EAST_1", "US_WEST_1"]

          enable_screenshot_on_failure_and_script = true
          runtime_type_version                    = "100"
          runtime_type                            = "CHROME_BROWSER"
          script_language                         = "JAVASCRIPT"
          script                                  = "$browser.get('https://test.com');"
          devices                                 = ["DESKTOP", "TABLET_LANDSCAPE", "MOBILE_PORTRAIT", "TABLET_LANDSCAPE", "TABLET_PORTRAIT"]
          browsers                                = ["CHROME", "FIREFOX"]

          tags = {
            environment = ["test"]
            team        = ["platform", "sre"]
          }
        }
      }

      script_api = {
        "test" = {
          name             = "Script API Test"
          status           = "ENABLED"
          period           = "EVERY_30_MINUTES"
          locations_public = ["US_EAST_1", "US_WEST_1"]

          runtime_type_version = "16.10"
          runtime_type         = "NODE_API"
          script_language      = "JAVASCRIPT"
          script               = "$http.get('https://test.com');"

          tags = {
            environment = ["test"]
            team        = ["platform", "sre"]
          }
        }
      }

      cert_check = {
        "test" = {
          name                   = "Cert Check Test"
          status                 = "ENABLED"
          period                 = "EVERY_DAY"
          domain                 = "test.com"
          locations_public       = ["US_EAST_1", "US_WEST_1"]
          certificate_expiration = 30

          runtime_type         = "NODE_API"
          runtime_type_version = "16.10"

          tags = {
            environment = ["test"]
            team        = ["platform", "sre"]
          }
        }
      }

      step_monitor = {
        "test" = {
          name             = "Step Monitor Test"
          status           = "ENABLED"
          period           = "EVERY_5_MINUTES"
          locations_public = ["US_EAST_1", "US_WEST_1"]

          enable_screenshot_on_failure_and_script = true
          runtime_type                            = "CHROME_BROWSER"
          runtime_type_version                    = "100"
          devices                                 = ["DESKTOP"]
          browsers                                = ["CHROME"]

          steps = [
            {
              ordinal = 0
              type    = "NAVIGATE"
              values  = ["https://test.com"]
            },
            {
              ordinal = 1
              type    = "ASSERT_TITLE"
              values  = ["==", "Test Page"]
            }
          ]

          tags = {
            environment = ["test"]
            team        = ["platform", "sre"]
          }
        }
      }
    }
  }

  assert {
    condition     = length(newrelic_synthetics_monitor.simple["test"]) > 0
    error_message = "Simple monitor 'test' has not been created"
  }

  assert {
    condition     = length(newrelic_synthetics_monitor.browser["test"]) > 0
    error_message = "Browser monitor 'test' has not been created"
  }

  assert {
    condition     = length(newrelic_synthetics_broken_links_monitor.default["test"]) > 0
    error_message = "Broken links monitor 'test' has not been created"
  }

  assert {
    condition     = length(newrelic_synthetics_script_monitor.script_browser["test"]) > 0
    error_message = "Script browser monitor 'test' has not been created"
  }

  assert {
    condition     = length(newrelic_synthetics_script_monitor.script_api["test"]) > 0
    error_message = "Script API monitor 'test' has not been created"
  }

  assert {
    condition     = length(newrelic_synthetics_cert_check_monitor.default["test"]) > 0
    error_message = "Cert check monitor 'test' has not been created"
  }

  assert {
    condition     = length(newrelic_synthetics_step_monitor.default["test"]) > 0
    error_message = "Step monitor 'test' has not been created"
  }
}
