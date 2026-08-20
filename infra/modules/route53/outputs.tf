output "fqdn" {
  description = "Fully qualified domain name for Gatus"
  value       = aws_route53_record.gatus.fqdn
}