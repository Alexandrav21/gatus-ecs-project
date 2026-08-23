resource "aws_cloudwatch_metric_alarm" "ecs_cpu_high" {
  alarm_name        = "${var.project_name}-ecs-high-cpu"
  alarm_description = "Alerts when the Gatus ECS service has sustained high CPU usage"

  namespace   = "AWS/ECS"
  metric_name = "CPUUtilization"

  dimensions = {
    ClusterName = var.cluster_name
    ServiceName = var.service_name
  }

  statistic = "Average"
  period    = 60

  evaluation_periods  = 2
  datapoints_to_alarm = 2

  threshold           = 80
  comparison_operator = "GreaterThanThreshold"

  alarm_actions = [var.sns_topic_arn]

  treat_missing_data = "notBreaching"

  tags = {
    Name = "${var.project_name}-ecs-high-cpu"
  }
}