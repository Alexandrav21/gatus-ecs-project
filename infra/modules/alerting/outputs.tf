output "sns_topic_arn" {
  description = "ARN of the Gatus SNS alert topic"
  value       = aws_sns_topic.gatus_alerts.arn
}

output "sns_parameter_arn" {
  description = "ARN of the SSM parameter containing the SNS topic ARN"
  value       = aws_ssm_parameter.sns_topic_arn.arn
}