#---vpc-outputs.tf

output "vpc_id" {
    description = "ID of custom vpc"
    value = aws_vpc.three_tier_vpc.id
}

output "public_subnet" {
    description = "public subnet"
    value = aws_subnet.public_subnet.id
}

output "private_subnet_1" {
    description = "private subnet 1"
    value = aws_subnet.private_subnet_1.id
}

output "private_subnet_2" {
    description = "private subnet 2"
    value = aws_subnet.private_subnet_2.id
}