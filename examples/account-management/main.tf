# tflint-ignore: terraform_required_version
module "example" {
  source = "../../modules/account-management"

  region = "us01"
  name   = "Example"
}
