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

resource "aws_internet_gateway" "three_tier_igw" {
    vpc_id = aws_vpc.three_tier_vpc.id
    
    tags = {
        Name = "3_tier_igw"
    }
}

resource "aws_eip" "three_tier_eip" {
    domain = "vpc" 
}

resource "aws_nat_gateway" "three_tier_nat_gw" {
    allocation_id = aws_eip.three_tier_eip.id
    subnet_id = aws_subnet.public_subnet.id
    
    tags = {
        Name = "3_tier_nat_gw"
    }
    
    depends_on = [aws_internet_gateway.three_tier_igw]
}