variable "project_name" {
  description = "Name used for ECS resources"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "repository_url" {
  description = "URL of the ECR repository"
  type        = string
}

variable "image_tag" {
  description = "Docker image tag to deploy"
  type        = string
}

variable "task_execution_role_arn" {
  description = "ARN of the ECS task execution role"
  type        = string
}

variable "task_role_arn" {
  description = "ARN of the ECS task role"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnets used by ECS"
  type        = list(string)
}

variable "ecs_security_group_id" {
  description = "Security group attached to ECS tasks"
  type        = string
}

variable "target_group_arn" {
  description = "ARN of the ALB target group"
  type        = string
}

variable "log_group_name" {
  description = "CloudWatch log group used by the container"
  type        = string
}