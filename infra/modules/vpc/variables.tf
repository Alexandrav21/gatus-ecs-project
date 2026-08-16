variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability Zones for the public subnets"
  type        = list(string)
}

variable "project_name" {
  description = "Name used to tag project resources"
  type        = string
}