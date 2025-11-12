terraform {
  required_version = ">= 1.7.0"

  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 3.0"
    }
  }
}

provider "newrelic" {
  # Configuration through environment variables:
  # NEW_RELIC_ACCOUNT_ID
  # NEW_RELIC_API_KEY
  # NEW_RELIC_REGION
}
