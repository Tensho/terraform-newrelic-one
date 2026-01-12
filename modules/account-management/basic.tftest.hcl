run "basic" {
  # The `newrelic_account_management` resource will only create/update but won't delete a sub account.
  command = plan

  variables {
    region = "us01"
    name   = "Test"
  }
}

run "bad_region" {
  command = plan

  variables {
    region = "west-coast"
    name   = "Test"
  }

  expect_failures = [
    var.region,
  ]
}

