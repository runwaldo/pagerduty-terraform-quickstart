variable "name" {
  description = "Name prefix used for the escalation policy and its schedules"
  type        = string
}

variable "team_id" {
  description = "ID of the PagerDuty team this escalation policy belongs to"
  type        = string
}

variable "primary_users" {
  description = "List of user IDs for the primary on-call schedule"
  type        = list(string)
}

variable "secondary_users" {
  description = "List of user IDs for the secondary on-call schedule"
  type        = list(string)
}

variable "escalation_user_id" {
  description = "User ID for the final (manager-level) escalation target"
  type        = string
}

variable "time_zone" {
  description = "Time zone for the on-call schedules"
  type        = string
  default     = "Europe/London"
}

variable "rotation_turn_length_seconds" {
  description = "Length of each rotation turn in seconds (default: 604800 = 1 week)"
  type        = number
  default     = 604800
}
