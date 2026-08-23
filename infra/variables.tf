variable "aws_region" {
  description = "AWS region for the Gatus infrastructure"
  type        = string
  default     = "eu-west-2"
}

variable "project_name" {
  description = "Name used for project resources"
  type        = string
  default     = "gatus-dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the project VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)

  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

variable "availability_zones" {
  description = "Availability Zones used by the project"
  type        = list(string)

  default = [
    "eu-west-2a",
    "eu-west-2b"
  ]
}

variable "notification_email" {
  description = "Email address used for Gatus SNS alerts"
  type        = string
  sensitive   = true
}

variable "github_oidc_subject" {
  description = "GitHub OIDC subject allowed to assume the AWS deployment role"
  type        = string

  default = "repo:Alexandrav21@122618599/gatus-ecs-project@1336304199:ref:refs/heads/main"
}