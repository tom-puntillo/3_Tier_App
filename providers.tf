#root-providers.tf

# Declare the required provider for AWS with specific version constraints
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Use version 5.0 or later of the AWS provider
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1" # Set the AWS region to US East (N. Virginia)
}