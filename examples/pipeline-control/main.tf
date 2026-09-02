# tflint-ignore: terraform_required_version
module "example" {
  source = "../../modules/pipeline-control"

  cloud_rules = {
    "debug-logs" = {
      name        = "Example Drop Debug Logs"
      description = "Example pipeline cloud rule managed by Terraform"
      nrql        = "DELETE FROM Log WHERE logLevel = 'DEBUG' AND environment = 'test'"
    }

    "health-check-transactions" = {
      name        = "Example Drop Health Check Transactions"
      description = "Example pipeline cloud rule managed by Terraform"
      nrql        = "DELETE FROM Transaction WHERE request.uri = '/health'"
    }
  }
}
