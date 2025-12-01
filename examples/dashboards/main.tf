module "example" {
  source = "../../modules/dashboards"

  dashboards = {
    "example" = templatefile("dashboard.json.tftpl", {
      account_id = 1234567

      applications = [
        {
          name    = "Example One",
          appName = "app1",
        },
        {
          name    = "Example Two",
          appName = "app2",
        },
      ]
    })

    "例" = templatefile("dashboard.json.tftpl", {
      account_id = 7654321

      applications = [
        {
          name    = "例1",
          appName = "app1",
        },
        {
          name    = "例2",
          appName = "app2",
        },
      ]
    })
  }
}
