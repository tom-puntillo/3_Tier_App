#---security_groups-main.tf

# Define an AWS security group resource named "allow_http"
resource "aws_security_group" "allow_http" {
  name        = "allow_http"                  # Set the name of the security group to "allow_http"
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
    Name = "allow_http" # Set the tag 'Name' to "allow_http"
  }
}