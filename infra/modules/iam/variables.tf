variable "project_name" {
  description = "Name used for IAM resources"
  type        = string
}

variable "github_oidc_subject" {
  description = "GitHub OIDC subject allowed to assume the deployment role"
  type        = string
}