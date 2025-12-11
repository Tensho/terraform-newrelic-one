output "simple_synthetic_monitor_ids" {
  description = "Simple synthetics monitor IDs"

  value = {
    for synthetic_monitor_key, synthetic_monitor in newrelic_synthetics_monitor.simple : synthetic_monitor_key => synthetic_monitor.id
  }
}

output "browser_synthetic_monitor_ids" {
  description = "Browser synthetics monitor IDs"

  value = {
    for synthetic_monitor_key, synthetic_monitor in newrelic_synthetics_monitor.browser : synthetic_monitor_key => synthetic_monitor.id
  }
}

output "broken_links_synthetic_monitor_ids" {
  description = "Broken links synthetics monitor IDs"

  value = {
    for synthetic_monitor_key, synthetic_monitor in newrelic_synthetics_broken_links_monitor.default : synthetic_monitor_key => synthetic_monitor.id
  }
}

output "script_browser_synthetic_monitor_ids" {
  description = "Script browser synthetics monitor IDs"

  value = {
    for synthetic_monitor_key, synthetic_monitor in newrelic_synthetics_script_monitor.script_browser : synthetic_monitor_key => synthetic_monitor.id
  }
}

output "script_api_synthetic_monitor_ids" {
  description = "Script API synthetics monitor IDs"

  value = {
    for synthetic_monitor_key, synthetic_monitor in newrelic_synthetics_script_monitor.script_api : synthetic_monitor_key => synthetic_monitor.id
  }
}

output "cert_check_synthetic_monitor_ids" {
  description = "Certificate check synthetics monitor IDs"

  value = {
    for synthetic_monitor_key, synthetic_monitor in newrelic_synthetics_cert_check_monitor.default : synthetic_monitor_key => synthetic_monitor.id
  }
}

output "step_monitor_synthetic_monitor_ids" {
  description = "Step monitor synthetics monitor IDs"

  value = {
    for synthetic_monitor_key, synthetic_monitor in newrelic_synthetics_step_monitor.default : synthetic_monitor_key => synthetic_monitor.id
  }
}

