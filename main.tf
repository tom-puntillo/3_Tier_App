#---root-main.tf

module "vpc" {

  source = "./vpc"
}

module "security_groups" {
  source = "./security_groups"

  vpc_id = module.vpc.vpc_id
}