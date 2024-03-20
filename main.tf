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

  # Specify the security groups for allowing HTTP and HTTPS traffic
  security_groups     = [module.security_groups.security_group_http.id, module.security_groups.security_group_tls.id]
  public_subnet_1_id  = module.vpc.public_subnet_1_id
  public_subnet_2_id  = module.vpc.public_subnet_2_id
  private_subnet_1_id = module.vpc.private_subnet_1_id
  private_subnet_2_id = module.vpc.private_subnet_2_id
  private_subnet_3_id = module.vpc.private_subnet_3_id
  private_subnet_4_id = module.vpc.private_subnet_4_id
}

# Create Application Load Balancer (ALB) module
module "alb" {
  source = "./alb"

  # Pass necessary parameters to the ALB module
  vpc_id              = module.vpc.vpc_id
  security_groups     = [module.security_groups.security_group_http.id, module.security_groups.security_group_tls.id]
  public_subnet_1_id  = module.vpc.public_subnet_1_id
  public_subnet_2_id  = module.vpc.public_subnet_2_id
  private_subnet_1_id = module.vpc.private_subnet_1_id
  private_subnet_2_id = module.vpc.private_subnet_2_id
  private_subnet_3_id = module.vpc.private_subnet_3_id
  private_subnet_4_id = module.vpc.private_subnet_4_id
  web_asg_name        = module.ec2.web_asg_name
  web_asg_id          = module.ec2.web_asg_id
  ec2_instance_ids_0  = module.ec2.ec2_instance_ids_0
  ec2_instance_ids_1  = module.ec2.ec2_instance_ids_1
  ec2_instance_ids_2  = module.ec2.ec2_instance_ids_2
  ec2_instance_ids_3  = module.ec2.ec2_instance_ids_3
}
