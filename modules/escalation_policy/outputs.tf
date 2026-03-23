output "escalation_policy_id" {
  description = "ID of the created escalation policy"
  value       = pagerduty_escalation_policy.this.id
}

output "primary_schedule_id" {
  description = "ID of the primary on-call schedule"
  value       = pagerduty_schedule.primary.id
}

output "secondary_schedule_id" {
  description = "ID of the secondary on-call schedule"
  value       = pagerduty_schedule.secondary.id
}
