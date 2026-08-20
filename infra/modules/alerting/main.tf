resource "aws_sns_topic" "gatus_alerts" {
  name = "${var.project_name}-alerts"

  tags = {
    Name = "${var.project_name}-alerts"
  }
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.gatus_alerts.arn
  protocol  = "email"
  endpoint  = var.notification_email
}

resource "aws_ssm_parameter" "sns_topic_arn" {
  name        = "/${var.project_name}/sns-topic-arn"
  description = "SNS topic ARN used by Gatus for alerting"
  type        = "String"
  value       = aws_sns_topic.gatus_alerts.arn

  tags = {
    Name = "${var.project_name}-sns-topic-arn"
  }
}