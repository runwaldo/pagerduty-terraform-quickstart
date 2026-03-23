/*
  Escalation Policy Module
  Creates two on-call schedules (primary and secondary) and an escalation policy
  that routes through them before reaching the escalation user.

  Note: pagerduty_schedule is used here (not pagerduty_schedulev2) because
  pagerduty_schedule supports the layer {} block syntax. pagerduty_schedulev2
  uses a layers attribute (list of objects) instead of nested blocks.
  Ref: https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/schedule
*/

resource "pagerduty_schedule" "primary" {
  name      = "${var.name} Primary Schedule"
  time_zone = var.time_zone

  layer {
    name                         = "Primary Rotation"
    start                        = "2020-06-21T00:00:00+00:00"
    rotation_virtual_start       = "2020-06-21T07:00:00+00:00"
    rotation_turn_length_seconds = var.rotation_turn_length_seconds
    users                        = var.primary_users
  }
}

resource "pagerduty_schedule" "secondary" {
  name      = "${var.name} Secondary Schedule"
  time_zone = var.time_zone

  layer {
    name                         = "Secondary Rotation"
    start                        = "2020-06-21T00:00:00+00:00"
    rotation_virtual_start       = "2020-06-21T07:00:00+00:00"
    rotation_turn_length_seconds = var.rotation_turn_length_seconds
    users                        = var.secondary_users
  }
}

resource "pagerduty_escalation_policy" "this" {
  name      = "${var.name} (EP)"
  num_loops = 3
  teams     = [var.team_id]

  rule {
    escalation_delay_in_minutes = 15
    target {
      type = "schedule_reference"
      id   = pagerduty_schedule.primary.id
    }
  }

  rule {
    escalation_delay_in_minutes = 30
    target {
      type = "schedule_reference"
      id   = pagerduty_schedule.secondary.id
    }
  }

  rule {
    escalation_delay_in_minutes = 60
    target {
      type = "user_reference"
      id   = var.escalation_user_id
    }
  }
}
