run "basic" {
  variables {
    destinations = {
      "webhook" = {
        name = "example"
        type = "WEBHOOK"

        secure_url = {
          prefix        = "https://webhook.example.com/"
          secure_suffix = "service_id/123456"
        }

        properties = [
          {
            key   = "source"
            value = "terraform"
          }
        ]

        auth_custom_header = {
          key   = "API_KEY"
          value = "abcd1234"
        }
      }

      "pagerduty" = {
        name = "example"
        type = "PAGERDUTY_ACCOUNT_INTEGRATION"

        properties = [
          {
            key   = "source"
            value = "terraform"
          }
        ]

        auth_token = {
          prefix = "Token token="
          token  = "u+AABBCCDDEEGGHHIIJJ"
        }
      }
    }
  }
}
