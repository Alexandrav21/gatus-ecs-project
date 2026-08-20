variable "project_name" {
  description = "Name used for IAM resources"
  type        = string
}

variable "sns_topic_arn" {
  description = "SNS topic ARN that Gatus is allowed to publish to"
  type        = string
}