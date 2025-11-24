output "destination_ids" {
  description = "Destination IDs"
  value = {
    for destination_key, destination in newrelic_notification_destination.default : destination_key => destination.id
  }
}

output "workflow_ids" {
  description = "Workflow IDs"
  value = {
    for workflow_key, workflow in newrelic_workflow.default : workflow_key => workflow.id
  }
}
