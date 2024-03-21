#---security_groups-main.tf

# Define an AWS security group resource named "allow_http"
resource "aws_security_group" "allow_http_and_tls_web" {
  name        = "web_security_group"          # Set the name of the security group to "allow_http"
  description = "Allows HTTP inbound traffic" # Provide a description for the security group
  vpc_id      = var.vpc_id                    # Set the VPC ID for the security group based on the input variable 'vpc_id'

  # Define inbound traffic rules
  ingress {
    description = "HTTP from Anywhere" # Set the description for the ingress rule
    to_port     = 80                   # Allow traffic to port 80
    from_port   = 80                   # Allow traffic from port 80
    protocol    = "tcp"                # Allow TCP protocol
    cidr_blocks = ["0.0.0.0/0"]        # Allow traffic from any IPv4 address
  }

  # Define outbound traffic rules
  egress {
    from_port        = 0             # Allow traffic from any port
    to_port          = 0             # Allow traffic to any port
    protocol         = "-1"          # Allow all protocols
    cidr_blocks      = ["0.0.0.0/0"] # Allow traffic to any IPv4 address
    ipv6_cidr_blocks = ["::/0"]      # Allow traffic to any IPv6 address
  }

  # Set tags for the security group
  tags = {
    Name = "allow_traffic_from_internet" # Set the tag 'Name' to "allow_http"
  }
}

resource "aws_security_group_rule" "allow_tls_web" {
  type              = "ingress"
  to_port           = 443
  from_port         = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_http_and_tls_web.id
}

resource "aws_security_group_rule" "allow_ssh_web" {
  type              = "ingress"
  to_port           = 22
  from_port         = 22
  protocol          = "ssh"
  cidr_blocks       = ["73.0.169.120/32"]
  security_group_id = aws_security_group.allow_http_and_tls_web.id
}

# Define an AWS security group resource named "allow_tls"
resource "aws_security_group" "allow_http_and_tls_logic" {
  name        = "logic_security_group"
  description = "Allows HTTP and HTTPS inbound traffic"
  vpc_id      = var.vpc_id

  # Define inbound traffic rules for HTTPS
  ingress {
    to_port         = 80
    from_port       = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.allow_http_and_tls_web.id]
  }

  # Define outbound traffic rules
  egress {
    to_port          = 0
    from_port        = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # Set tags for the security group
  tags = {
    Name = "allow_traffic_from_web_tier"
  }
}

resource "aws_security_group_rule" "allow_tls_logic" {
  type              = "ingress"
  to_port           = 443
  from_port         = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_http_and_tls_logic.id
}

