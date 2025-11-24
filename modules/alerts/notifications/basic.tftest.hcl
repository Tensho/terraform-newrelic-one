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

    workflows = {
      "example-one" = {
        name = "Example One"

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
            name = "Example one"
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

  assert {
    condition     = length(newrelic_notification_destination.default["webhook"]) > 0
    error_message = "Destination 'webhook' has not been created"
  }

  assert {
    condition     = length(newrelic_notification_destination.default["pagerduty"]) > 0
    error_message = "Destination 'pagerduty' has not been created"
  }

  assert {
    condition     = length(newrelic_notification_channel.default["example-one/webhook"]) > 0
    error_message = "Notification channel 'example-one/webhook' has not been created"
  }

  assert {
    condition     = length(newrelic_workflow.default["example-one"]) > 0
    error_message = "Workflow 'example-one' has not been created"
  }
}
