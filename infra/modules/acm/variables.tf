variable "domain_name" {
  description = "Domain name for the ACM certificate"
  type        = string
}

variable "hosted_zone_id" {
  description = "Route 53 hosted zone ID used for DNS validation"
  type        = string
}

variable "project_name" {
  description = "Name used for project resources"
  type        = string
}