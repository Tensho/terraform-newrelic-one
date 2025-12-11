module "example" {
  source = "../../modules/synthetics-monitors"

  synthetics_monitors = {
    simple = {
      "example" = {
        name             = "Simple Example"
        status           = "ENABLED"
        period           = "EVERY_MINUTE"
        uri              = "https://example.com"
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

        tag = [
          {
            key    = "environment"
            values = ["production"]
          }
        ]
      }
    }

    browser = {
      "example" = {
        name             = "Browser Example"
        status           = "ENABLED"
        period           = "EVERY_5_MINUTES"
        uri              = "https://example.com"
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

        tag = [
          {
            key    = "environment"
            values = ["production"]
          }
        ]
      }
    }

    broken_links = {
      "example" = {
        name             = "Broken Links Example"
        status           = "ENABLED"
        period           = "EVERY_DAY"
        uri              = "https://example.com"
        locations_public = ["US_EAST_1", "US_WEST_1"]

        runtime_type         = "NODE_API"
        runtime_type_version = "16.10"

        tag = [
          {
            key    = "environment"
            values = ["production"]
          }
        ]
      }
    }

    script_browser = {
      "example" = {
        name             = "Script Browser Example"
        status           = "ENABLED"
        period           = "EVERY_5_MINUTES"
        locations_public = ["US_EAST_1", "US_WEST_1"]

        enable_screenshot_on_failure_and_script = true
        runtime_type_version                    = "100"
        runtime_type                            = "CHROME_BROWSER"
        script_language                         = "JAVASCRIPT"
        script                                  = "$browser.get('https://example.com');"
        devices                                 = ["DESKTOP", "TABLET_LANDSCAPE", "MOBILE_PORTRAIT", "TABLET_LANDSCAPE", "TABLET_PORTRAIT"]

        tag = [
          {
            key    = "environment"
            values = ["production"]
          }
        ]
      }
    }

    script_api = {
      "example" = {
        name             = "Script API Example"
        status           = "ENABLED"
        period           = "EVERY_5_MINUTES"
        locations_public = ["US_EAST_1", "US_WEST_1"]

        runtime_type_version = "16.10"
        runtime_type         = "NODE_API"
        script_language      = "JAVASCRIPT"
        script               = "$http.get('https://example.com');"

        tag = [
          {
            key    = "environment"
            values = ["production"]
          }
        ]
      }
    }

    cert_check = {
      "example" = {
        name                   = "Certificate Check Example"
        status                 = "ENABLED"
        period                 = "EVERY_DAY"
        domain                 = "example.com"
        locations_public       = ["US_EAST_1", "US_WEST_1"]
        certificate_expiration = 30
        runtime_type           = "NODE_API"
        runtime_type_version   = "16.10"

        tag = [
          {
            key    = "environment"
            values = ["production"]
          }
        ]
      }
    }

    step_monitor = {
      "example" = {
        name                                    = "Step Monitor Example"
        status                                  = "ENABLED"
        period                                  = "EVERY_5_MINUTES"
        locations_public                        = ["US_EAST_1", "US_WEST_1"]
        enable_screenshot_on_failure_and_script = true
        runtime_type                            = "CHROME_BROWSER"
        runtime_type_version                    = "100"

        steps = [
          {
            ordinal = 0
            type    = "NAVIGATE"
            values  = ["https://example.com"]
          },
          {
            ordinal = 1
            type    = "ASSERT_TITLE"
            values  = ["==", "Example Page"]
          }
        ]

        tag = [
          {
            key    = "environment"
            values = ["production"]
          }
        ]
      }
    }
  }
}
