#---vpc-main.tf

resource "aws_vpc" "three_tier_vpc" {
    cidr_block = "10.0.0.0/16"
    
    tags = {
        Name = "3_tier_vpc"
    }
}

resource "aws_subnet" "public_subnet_1" {
 vpc_id = aws_vpc.three_tier_vpc.id
 cidr_block = var.public_subnet_1
 availability_zone = "us-east-1a"
 map_public_ip_on_launch = true
 
 tags = {
     Name = "web_subnet_1"
 }
 }
 
 resource "aws_subnet" "public_subnet_2" {
 vpc_id = aws_vpc.three_tier_vpc.id
 cidr_block = var.public_subnet_2
 availability_zone = "us-east-1b"
 map_public_ip_on_launch = true
 
 tags = {
     Name = "web_subnet_2"
 }
 }

resource "aws_subnet" "private_subnet_1" {
    vpc_id = aws_vpc.three_tier_vpc.id
    cidr_block = var.private_subnet_1
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = false
    
    tags = {
        Name = "logic_subnet_1"
    }
}

resource "aws_subnet" "private_subnet_2" {
    vpc_id = aws_vpc.three_tier_vpc.id
    cidr_block = var.private_subnet_2
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = false
    
    tags = {
        Name = "logic_subnet_2"
    }
}

resource "aws_subnet" "private_subnet_3" {
    vpc_id = aws_vpc.three_tier_vpc.id
    cidr_block = var.private_subnet_3
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = false
    
    tags = {
        Name = "database_subnet_1"
    }
}


resource "aws_subnet" "private_subnet_4" {
    vpc_id = aws_vpc.three_tier_vpc.id
    cidr_block = var.private_subnet_4
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = false
    
    tags = {
        Name = "database_subnet_2"
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
    subnet_id = aws_subnet.public_subnet_1.id
    
    tags = {
        Name = "3_tier_nat_gw"
    }
    
    depends_on = [aws_internet_gateway.three_tier_igw]
}

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.three_tier_vpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.three_tier_igw.id
    }
    
    tags = {
        Name = "public_rt"
    }
}

resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.three_tier_vpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.three_tier_nat_gw.id
    }
}

resource "aws_route_table_association" "public_rt_association_1" {
    subnet_id = aws_subnet.public_subnet_1.id
    route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_association_2" {
    subnet_id = aws_subnet.public_subnet_2.id
    route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table_association" "private_rt_association_1" {
    subnet_id = aws_subnet.private_subnet_1.id
    route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rt_association_2" {
    subnet_id = aws_subnet.private_subnet_2.id
    route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rt_association_3" {
    subnet_id = aws_subnet.private_subnet_3.id
    route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rt_association_4" {
    subnet_id = aws_subnet.private_subnet_4.id
    route_table_id = aws_route_table.private_rt.id
}