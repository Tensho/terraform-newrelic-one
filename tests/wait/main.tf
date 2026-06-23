# tflint-ignore: terraform_required_version
# tflint-ignore: terraform_required_providers
resource "time_sleep" "wait" {
  create_duration = "5s"
}
