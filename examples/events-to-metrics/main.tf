# tflint-ignore: terraform_required_version
module "example" {
  source = "../../modules/events-to-metrics"

  rules = {
    "transaction-duration" = {
      name        = "Example Transaction Duration"
      description = "Example events to metrics rule managed by Terraform"
      account_id  = 7479170
      nrql        = "SELECT summary(duration) AS `example.transaction.duration` FROM Transaction FACET appName"
      enabled     = true
    }

    "transaction-hosts" = {
      name        = "Example Transaction Hosts"
      description = "Example events to metrics rule managed by Terraform"
      account_id  = 7479170
      nrql        = "SELECT uniqueCount(host) AS `example.transaction.hostCount` FROM Transaction FACET appName"
    }
  }
}
