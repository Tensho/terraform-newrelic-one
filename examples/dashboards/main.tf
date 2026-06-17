module "example" {
  source = "../../modules/dashboards"

  dashboards = {
    "example" = {
      json = templatefile("dashboard.json.tftpl", {
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

      tags = {
        environment = ["production"]
        team        = ["platform", "sre"]
      }
    }

    "例" = {
      json = templatefile("dashboard.json.tftpl", {
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

      tags = {
        environment = ["production"]
        team        = ["platform", "sre"]
      }
    }
  }
}
