module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name

  vpc_cidr = var.vpc_cidr

  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones  = var.availability_zones
}