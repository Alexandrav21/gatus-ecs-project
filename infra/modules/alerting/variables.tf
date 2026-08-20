variable "project_name" {
  description = "Name used for alerting resources"
  type        = string
}

variable "notification_email" {
  description = "Email address subscribed to Gatus alerts"
  type        = string
  sensitive   = true
}