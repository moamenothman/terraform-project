provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./modules/network"

  environment = var.environment
  vpc_cidr    = var.vpc_cidr

  public_subnet_1  = var.public_subnet_1
  public_subnet_2  = var.public_subnet_2

  private_subnet_1 = var.private_subnet_1
  private_subnet_2 = var.private_subnet_2

  az_1 = var.az_1
  az_2 = var.az_2
}

module "alb" {
  source = "./modules/alb"

  environment = var.environment
  vpc_id      = module.network.vpc_id

  public_subnets = [
    module.network.public_subnet_1_id,
    module.network.public_subnet_2_id
  ]
}

module "compute" {
  source = "./modules/compute"

  environment = var.environment

  private_subnet_1 = module.network.private_subnet_1_id
  private_subnet_2 = module.network.private_subnet_2_id

  alb_sg_id        = module.alb.alb_sg_id
  target_group_arn = module.alb.target_group_arn
}