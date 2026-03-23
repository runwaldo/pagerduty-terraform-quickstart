/* 
  PagerDuty Team Definition
  Ref: https://www.terraform.io/docs/providers/pagerduty/r/team.html
*/

resource "pagerduty_team" "kawabunga" {
  name        = "kawabunga"
  description = "Support and IT Management Team"
}

resource "pagerduty_team" "operations" {
  name        = "Operations"
  description = "24x7 Operations Team"
}

resource "pagerduty_team" "executive" {
  name        = "Executive Stakeholders"
  description = "Executive Stakeholders"
}