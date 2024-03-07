#---vpc-main.tf

resource "aws_vpc" "three_tier_vpc" {
    cidr_block = "10.0.0.0/16"
    
    tags = {
        Name = "3_tier_vpc"
    }
}

resource "aws_subnet" "public_subnet" {
 vpc_id = aws_vpc.three_tier_vpc.id
 cidr_block = var.public_subnet
 availability_zone = "us-east-1a"
 map_public_ip_on_launch = true
 
 tags = {
     Name = "web_subnet"
 }
 
}

resource "aws_subnet" "private_subnet_1" {
    vpc_id = aws_vpc.three_tier_vpc.id
    cidr_block = var.private_subnet_1
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true
    
    tags = {
        Name = "logic_subnet"
    }
}

resource "aws_subnet" "private_subnet_2" {
    vpc_id = aws_vpc.three_tier_vpc.id
    cidr_block = var.private_subnet_2
    availability_zone = "us-east-1c"
    map_public_ip_on_launch = true
    
    tags = {
        Name = "database_subnet"
    }
}