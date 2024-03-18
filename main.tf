#---root-main.tf

# Create VPC module
module "vpc" {
  source = "./vpc" # Use local module named 'vpc' located in the './vpc' directory
}

# Create Security Groups module
module "security_groups" {
  source = "./security_groups" # Use local module named 'security_groups' located in the './security_groups' directory

  # Pass the VPC ID from the 'vpc' module to the 'security_groups' module
  vpc_id = module.vpc.vpc_id
}

# Create EC2 instance module
module "ec2" {
  source = "./ec2"

  security_groups  = [module.security_groups.security_group_http.id, module.security_groups.security_group_tls.id] # Specify the security group for allowing HTTP traffic
  public_subnet_1  = module.vpc.public_subnet_1_cidr
  public_subnet_2  = module.vpc.public_subnet_2_cidr
  private_subnet_1 = module.vpc.private_subnet_1_cidr
  private_subnet_2 = module.vpc.private_subnet_2_cidr
  private_subnet_3 = module.vpc.private_subnet_3_cidr
  private_subnet_4 = module.vpc.private_subnet_4_cidr
}
