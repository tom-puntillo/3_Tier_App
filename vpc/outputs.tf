#---vpc-outputs.tf

output "vpc_id" {
    description = "ID of custom vpc"
    value = aws_vpc.three_tier_vpc.id
}

output "public_subnet_1" {
    description = "public subnet 1"
    value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2" {
    description = "public subnet 2"
    value = aws_subnet.public_subnet_2.id
}

output "private_subnet_1" {
    description = "private subnet 1"
    value = aws_subnet.private_subnet_1.id
}

output "private_subnet_2" {
    description = "private subnet 2"
    value = aws_subnet.private_subnet_2.id
}

output "private_subnet_3" {
    description = "private subnet 3"
    value = aws_subnet.private_subnet_3.id
}

output "private_subnet_4" {
    description = "private subnet 4"
    value = aws_subnet.private_subnet_4.id
}