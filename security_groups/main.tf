#---security_groups-main.tf

resource "aws_security_group" "allow_http" {

  name        = "allow_http"
  description = "Allows HTTP inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from Anywhere"
    to_port     = 80
    from_port   = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_http"
  }
}

