module "vpc" {
  source          = "git::https://github.com/Rushikendre060/tf_aws_modules.git//module/vpc?ref=main"
  name            = "vpc"
  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
  azs             = ["ap-south-1a", "ap-south-1b"]
}

module "mysql" {
  source          = "git::https://github.com/Rushikendre060/tf_aws_modules.git//module/mysql_db?ref=main"
  name            = "mysql-db"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnet_ids
  db_username     = "admin"
  db_password     = "SuperSecurePass123!"
}
