#---vpc-outputs.tf

# Define outputs to provide information about the created resources

# Output the ID of the custom VPC
output "vpc_id" {
  description = "ID of custom vpc"        # Description of the output
  value       = aws_vpc.three_tier_vpc.id # Value to output (ID of the VPC)
}

# Output the ID of public subnet 1
output "public_subnet_1_cidr" {
  description = "public subnet 1" # Description of the output
  value       = aws_subnet.public_subnet_1.cidr_block
}

# Output the ID of public subnet 2
output "public_subnet_2_cidr" {
  description = "public subnet 2" # Description of the output
  value       = aws_subnet.public_subnet_2.cidr_block
}

# Output the ID of private subnet 1
output "private_subnet_1_cidr" {
  description = "private subnet 1"                     # Description of the output
  value       = aws_subnet.private_subnet_1.cidr_block # Value to output (ID of the subnet)
}

# Output the ID of private subnet 2
output "private_subnet_2_cidr" {
  description = "private subnet 2"                     # Description of the output
  value       = aws_subnet.private_subnet_2.cidr_block # Value to output (ID of the subnet)
}

# Output the ID of private subnet 3
output "private_subnet_3_cidr" {
  description = "private subnet 3"                     # Description of the output
  value       = aws_subnet.private_subnet_3.cidr_block # Value to output (ID of the subnet)
}

# Output the ID of private subnet 4
output "private_subnet_4_cidr" {
  description = "private subnet 4"                     # Description of the output
  value       = aws_subnet.private_subnet_4.cidr_block # Value to output (ID of the subnet)
}
