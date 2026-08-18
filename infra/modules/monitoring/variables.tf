variable "project_name" {
  description = "Name used for monitoring resources"
  type        = string
}

variable "log_retention_days" {
  description = "Number of days to retain ECS logs"
  type        = number
  default     = 7
}