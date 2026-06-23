# tflint-ignore: terraform_required_version
module "example_synthetic_monitors" {
  source = "../../modules/synthetic-monitors"

  synthetic_monitors = {
    simple = {
      "example" = {
        name             = "Example"
        status           = "DISABLED"
        period           = "EVERY_MINUTE"
        uri              = "https://example.com"
        locations_public = ["US_EAST_1", "US_WEST_1"]
      }
    }
  }
}

# tflint-ignore: terraform_required_version
# tflint-ignore: terraform_required_providers
resource "time_sleep" "wait" {
  create_duration = "5s"

  depends_on = [
    module.example_synthetic_monitors,
  ]
}

module "example" {
  source = "../../modules/entities"

  entities = {
    "synthetic" = {
      name   = "Example"
      type   = "MONITOR"
      domain = "SYNTH"
    }
  }

  depends_on = [
    time_sleep.wait,
  ]
}
