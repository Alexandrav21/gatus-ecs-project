module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name

  vpc_cidr = var.vpc_cidr

  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones  = var.availability_zones
}

module "security_groups" {
  source = "./modules/security-groups"

  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
}

module "iam" {
  source = "./modules/iam"

  project_name = var.project_name
}

module "ecr" {
  source = "./modules/ecr"

  repository_name = "gatus"
}

module "monitoring" {
  source = "./modules/monitoring"

  project_name       = var.project_name
  log_retention_days = 7
}

# Use the existing Route 53 hosted zone retained from the ClickOps phase.
data "aws_route53_zone" "main" {
  name         = "labs.alexandravladu.co.uk"
  private_zone = false
}

module "acm" {
  source = "./modules/acm"

  project_name   = var.project_name
  domain_name    = "gatus.labs.alexandravladu.co.uk"
  hosted_zone_id = data.aws_route53_zone.main.zone_id
}

module "alb" {
  source = "./modules/alb"

  project_name          = var.project_name
  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.vpc.public_subnet_ids
  alb_security_group_id = module.security_groups.alb_security_group_id

  certificate_arn = module.acm.certificate_arn
}

module "ecs" {
  source = "./modules/ecs"

  project_name = var.project_name
  aws_region   = var.aws_region

  repository_url = module.ecr.repository_url
  image_tag      = "v1"

  task_execution_role_arn = module.iam.ecs_task_execution_role_arn
  task_role_arn           = module.iam.ecs_task_role_arn

  public_subnet_ids     = module.vpc.public_subnet_ids
  ecs_security_group_id = module.security_groups.ecs_security_group_id

  target_group_arn = module.alb.target_group_arn
  log_group_name   = module.monitoring.log_group_name
}

module "route53" {
  source = "./modules/route53"

  domain_name    = "gatus.labs.alexandravladu.co.uk"
  hosted_zone_id = data.aws_route53_zone.main.zone_id

  alb_dns_name = module.alb.alb_dns_name
  alb_zone_id  = module.alb.alb_zone_id
}