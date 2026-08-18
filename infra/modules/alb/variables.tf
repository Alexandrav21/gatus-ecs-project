variable "project_name" {
  description = "Name used for ALB resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC where the target group will be created"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnets used by the ALB"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Security group attached to the ALB"
  type        = string
}