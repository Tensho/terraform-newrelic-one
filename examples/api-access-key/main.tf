# tflint-ignore: terraform_required_version
module "example" {
  source = "../../modules/api-access-key"

  api_access_keys = {
    "license" = {
      key_type    = "INGEST"
      account_id  = 183613
      ingest_type = "LICENSE"
      name        = "Example License Key"
      notes       = "Example ingest license key managed by Terraform"
    }

    "browser" = {
      key_type    = "INGEST"
      account_id  = 183613
      ingest_type = "BROWSER"
      name        = "Example Browser Key"
      notes       = "Example ingest browser key managed by Terraform"
    }

    "user" = {
      key_type   = "USER"
      account_id = 183613
      user_id    = 1002813544
      name       = "Example User Key"
      notes      = "Example user key managed by Terraform"
    }
  }
}
