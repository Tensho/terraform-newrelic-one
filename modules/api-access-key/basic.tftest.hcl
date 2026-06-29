run "basic" {
  variables {
    api_access_keys = {
      "license" = {
        key_type    = "INGEST"
        account_id  = 183613
        ingest_type = "LICENSE"
        name        = "Test License Key"
      }

      "browser" = {
        key_type    = "INGEST"
        account_id  = 183613
        ingest_type = "BROWSER"
        name        = "Test Browser Key"
      }

      "user" = {
        key_type   = "USER"
        account_id = 183613
        user_id    = 1002813544
        name       = "Test User Key"
      }
    }
  }

  assert {
    condition     = length(newrelic_api_access_key.default["license"]) > 0
    error_message = "API access key 'license' has not been created"
  }

  assert {
    condition     = length(newrelic_api_access_key.default["browser"]) > 0
    error_message = "API access key 'ingest' has not been created"
  }

  assert {
    condition     = length(newrelic_api_access_key.default["user"]) > 0
    error_message = "API access key 'user' has not been created"
  }
}
