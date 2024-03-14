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