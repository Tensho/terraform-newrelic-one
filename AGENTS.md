# AGENTS.md

## Examples

Examples are run against **Example** sub-account, not the parent account.
Therefore, the `account-management` example cannot be applied this way (needs account provisioning scope); hence test is
configured to run plan mode there. This is a deliberate choice as sub-accounts can't be destroyed by the provider yet
([note from resource documentation](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/account_management))
