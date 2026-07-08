module "network" {
  source = "../../modules/network"

  aws_region = var.aws_region

  vpc_cidr = var.vpc_cidr

  public_subnet_1_cidr  = var.public_subnet_1_cidr
  public_subnet_2_cidr  = var.public_subnet_2_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr

}
module "Security_groups" {
  source = "../../modules/security_groups"

  vpc_id = module.network.vpc_id
}

module "rds" {
  source = "../../modules/rds"

  private_subnet_ids = module.network.private_subnet_ids

  rds_security_group_id = module.security_groups.rds_security_group_id

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password

  db_instance_class = var.db_instance_class

  backup_retention_period = var.backup_retention_period

  deletion_protection = var.deletion_protection
}

module "alb" {
  source = "../../modules/alb"

  vpc_id = module.network.vpc_id

  public_subnet_ids = module.network.public_subnet_ids

  alb_security_group_id = module.security_groups.alb_security_group_id
}

module "ecs" {
  source     = "../../modules/ecs"
  ecs_cpu    = var.ecs_cpu
  ecs_memory = var.ecs_memory

  container_name  = var.container_name
  container_image = var.container_image
  container_port  = var.container_port

  private_subnet_ids = module.network.private_subnet_ids

  ecs_security_group_id = module.security_groups.ecs_security_group_id

  target_group_arn = module.alb.target_group_arn
}
