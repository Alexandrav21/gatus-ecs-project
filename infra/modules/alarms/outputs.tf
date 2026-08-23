output "alarm_name" {
  description = "Name of the ECS CPU CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.ecs_cpu_high.alarm_name
}