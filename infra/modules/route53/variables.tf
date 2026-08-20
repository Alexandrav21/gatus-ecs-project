variable "domain_name" {
  description = "Domain name used to access Gatus"
  type        = string
}

variable "hosted_zone_id" {
  description = "Route 53 hosted zone ID"
  type        = string
}

variable "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  type        = string
}

variable "alb_zone_id" {
  description = "Route 53 zone ID of the Application Load Balancer"
  type        = string
}