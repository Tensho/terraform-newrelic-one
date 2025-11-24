module "example" {
  source = "../../../modules/alerts/notifications"

  destinations = {
    "webhook" = {
      name = "Example"
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
      name = "Example"
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

  workflows = {
    "alice" = {
      name = "Alice"

      muting_rules_handling = "NOTIFY_ALL_ISSUES"

      issues_filter = {
        name = "filter-name"
        type = "FILTER" # Deprecated

        predicates = [
          {
            attribute = "accumulations.tag.team"
            operator  = "EXACTLY_MATCHES"
            values    = ["growth"]
          },
          {
            attribute = "labels.policyIds"
            operator  = "EXACTLY_MATCHES"
            values    = ["1234567", "7654321"]
          },
          {
            attribute = "priority"
            operator  = "EQUAL"
            values    = ["CRITICAL"]
          },
        ]
      }

      notification_channels = {
        "webhook" = {
          name = "Example"
          type = "WEBHOOK"

          destination_key = "webhook"

          properties = [
            {
              key   = "payload"
              value = <<-EOT
                {
                  "payload": {
                    "summary": {{ json annotations.title.[0] }},
                    "severity": "critical",
                    "custom_details": {
                      "account_id": {{json nrAccountId}},
                    }
                  },
                  "routing_key": "abcd1234",
                  "dedup_key": {{json issueId}},
                  "event_action": "trigger",
                }
              EOT
              label = "Payload Template"
            }
          ]
        }
      }
    }
  }
}
