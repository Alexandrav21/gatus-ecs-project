terraform {
  backend "s3" {
    bucket       = "gatus-ecs-tf-state-lexi"
    key          = "dev/terraform.tfstate"
    region       = "eu-west-2"
    profile      = "gatus-terraform"
    use_lockfile = true
    encrypt      = true
  }
}