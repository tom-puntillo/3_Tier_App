#---security_groups-main.tf

# Define an AWS security group resource named "allow_http_and_tls_web"
resource "aws_security_group" "allow_http_and_tls_web" {
  name        = "web_security_group"          # Name of the security group for web tier
  description = "Allows HTTP inbound traffic" # Description of the security group
  vpc_id      = var.vpc_id                    # VPC ID for the security group

  # Define inbound traffic rules for HTTP
  ingress {
    description = "HTTP from Anywhere" # Description for the ingress rule
    to_port     = 80                   # Allow traffic to port 80
    from_port   = 80                   # Allow traffic from port 80
    protocol    = "tcp"                # TCP protocol
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
    Name = "allow_traffic_from_internet" # Name tag for the security group
  }
}

# Define a security group rule to allow HTTPS traffic
resource "aws_security_group_rule" "allow_tls_web" {
  type              = "ingress"
  to_port           = 443
  from_port         = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_http_and_tls_web.id # Reference to the security group
}

# Define a security group rule to allow SSH traffic
resource "aws_security_group_rule" "allow_ssh_web" {
  type              = "ingress"
  to_port           = 22
  from_port         = 22
  protocol          = "tcp"
  cidr_blocks       = [var.allowed_ip]                             # Allow traffic only from a specific IP
  security_group_id = aws_security_group.allow_http_and_tls_web.id # Reference to the security group
}

# Define an AWS security group resource named "allow_http_and_tls_logic"
resource "aws_security_group" "allow_http_and_tls_logic" {
  name        = "logic_security_group"
  description = "Allows HTTP and HTTPS inbound traffic"
  vpc_id      = var.vpc_id

  # Define inbound traffic rule for HTTP from the web tier security group
  ingress {
    to_port         = 80
    from_port       = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.allow_http_and_tls_web.id] # Reference to the security group
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

# Define a security group rule to allow HTTPS traffic from the logic tier
resource "aws_security_group_rule" "allow_tls_logic" {
  type                     = "ingress"
  to_port                  = 443
  from_port                = 443
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.allow_http_and_tls_web.id   # Reference to the security group
  security_group_id        = aws_security_group.allow_http_and_tls_logic.id # Reference to the security group
}

# Define a security group rule to allow ICMP traffic from the logic tier
resource "aws_security_group_rule" "allow_icmp_logic" {
  type                     = "ingress"
  to_port                  = -1
  from_port                = -1
  protocol                 = "icmp"
  source_security_group_id = aws_security_group.allow_http_and_tls_web.id   # Reference to the security group
  security_group_id        = aws_security_group.allow_http_and_tls_logic.id # Reference to the security group
}

# Define a security group rule to allow SSH traffic
resource "aws_security_group_rule" "allow_ssh_logic" {
  type                     = "ingress"
  to_port                  = 22
  from_port                = 22
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.allow_http_and_tls_web.id   # Reference to the security group
  security_group_id        = aws_security_group.allow_http_and_tls_logic.id # Reference to the security group
}

# Define a security group for MySQL
resource "aws_security_group" "allow_mysql" {
  name        = "db_security_group"            # Name of the security group for MySQL
  description = "Allows MySQL inbound traffic" # Description of the security group
  vpc_id      = var.vpc_id                     # VPC ID for the security group

  # Define inbound traffic rule for MySQL from the logic tier
  ingress {
    description     = "MySQL from Logic Tier"                          # Description for the ingress rule
    to_port         = 3306                                             # Allow traffic to port 3306
    from_port       = 3306                                             # Allow traffic from port 3306
    protocol        = "tcp"                                            # TCP protocol
    security_groups = [aws_security_group.allow_http_and_tls_logic.id] # Reference to the security group
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
    Name = "allow_mysql_traffic_from_logic_tier" # Name tag for the security group
  }
}
