variable "project_name" {
  description = "Name used for CloudWatch alarm resources"
  type        = string
}

variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "sns_topic_arn" {
  description = "SNS topic used for CloudWatch alarm notifications"
  type        = string
}