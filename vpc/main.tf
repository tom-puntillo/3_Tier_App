#---vpc-main.tf

# Create an AWS VPC resource named "three_tier_vpc" with the specified CIDR block
resource "aws_vpc" "three_tier_vpc" {
  cidr_block = "10.0.0.0/16" # Set the CIDR block for the VPC

  tags = {
    Name = "3_tier_vpc" # Set the tag 'Name' to "3_tier_vpc"
  }
}

# Create public subnets

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.three_tier_vpc.id # Associate with the VPC created above
  cidr_block              = var.public_subnet_1       # Use input variable for CIDR block
  availability_zone       = "us-east-1a"              # Specify the availability zone
  map_public_ip_on_launch = true                      # Enable auto-assignment of public IP addresses

  tags = {
    Name = "web_subnet_1" # Set the tag 'Name' to "web_subnet_1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.three_tier_vpc.id
  cidr_block              = var.public_subnet_2
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "web_subnet_2"
  }
}

# Create private subnets

resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.three_tier_vpc.id
  cidr_block              = var.private_subnet_1
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false # Do not auto-assign public IP addresses

  tags = {
    Name = "logic_subnet_1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.three_tier_vpc.id
  cidr_block              = var.private_subnet_2
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "logic_subnet_2"
  }
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id                  = aws_vpc.three_tier_vpc.id
  cidr_block              = var.private_subnet_3
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "database_subnet_1"
  }
}

resource "aws_subnet" "private_subnet_4" {
  vpc_id                  = aws_vpc.three_tier_vpc.id
  cidr_block              = var.private_subnet_4
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "database_subnet_2"
  }
}

# Create an internet gateway and associate it with the VPC
resource "aws_internet_gateway" "three_tier_igw" {
  vpc_id = aws_vpc.three_tier_vpc.id

  tags = {
    Name = "3_tier_igw"
  }
}

# Create an Elastic IP address for the NAT gateway
resource "aws_eip" "three_tier_eip" {
  domain = "vpc" # Specify the domain as "vpc"
}

# Create a NAT gateway and associate it with a public subnet
resource "aws_nat_gateway" "three_tier_nat_gw" {
  allocation_id = aws_eip.three_tier_eip.id     # Specify the Elastic IP allocation ID
  subnet_id     = aws_subnet.public_subnet_1.id # Associate with the first public subnet

  tags = {
    Name = "3_tier_nat_gw"
  }

  depends_on = [aws_internet_gateway.three_tier_igw] # Ensure the internet gateway is created first
}

# Create a public route table and associate it with the internet gateway
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.three_tier_vpc.id # Associate with the VPC

  route {
    cidr_block = "0.0.0.0/0"                            # Route all traffic
    gateway_id = aws_internet_gateway.three_tier_igw.id # Route via the internet gateway
  }

  tags = {
    Name = "public_rt"
  }
}

# Create private route tables and associate them with the NAT gateway

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.three_tier_vpc.id # Associate with the VPC

  route {
    cidr_block = "0.0.0.0/0"                          # Route all traffic
    gateway_id = aws_nat_gateway.three_tier_nat_gw.id # Route via the NAT gateway
  }
}

# Associate route tables with corresponding subnets

resource "aws_route_table_association" "public_rt_association_1" {
  subnet_id      = aws_subnet.public_subnet_1.id # Associate with the first public subnet
  route_table_id = aws_route_table.public_rt.id  # Associate with the public route table
}

resource "aws_route_table_association" "public_rt_association_2" {
  subnet_id      = aws_subnet.public_subnet_2.id # Associate with the second public subnet
  route_table_id = aws_route_table.public_rt.id  # Associate with the public route table
}

resource "aws_route_table_association" "private_rt_association_1" {
  subnet_id      = aws_subnet.private_subnet_1.id # Associate with the first private subnet
  route_table_id = aws_route_table.private_rt.id  # Associate with the private route table
}

resource "aws_route_table_association" "private_rt_association_2" {
  subnet_id      = aws_subnet.private_subnet_2.id # Associate with the second private subnet
  route_table_id = aws_route_table.private_rt.id  # Associate with the private route table
}

resource "aws_route_table_association" "private_rt_association_3" {
  subnet_id      = aws_subnet.private_subnet_3.id # Associate with the third private subnet
  route_table_id = aws_route_table.private_rt.id  # Associate with the private route table
}

resource "aws_route_table_association" "private_rt_association_4" {
  subnet_id      = aws_subnet.private_subnet_4.id # Associate with the fourth private subnet
  route_table_id = aws_route_table.private_rt.id  # Associate with the private route table
}
