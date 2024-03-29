#---ec2-main.tf

# Generate RSA key pair for EC2 instances
resource "tls_private_key" "web_key_pair_gen" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Save the public key to a local file
resource "local_file" "web_public_key" {
  content  = tls_private_key.web_key_pair_gen.public_key_openssh
  filename = "${path.module}/web_key.pub"

  depends_on = [tls_private_key.web_key_pair_gen]
}

# Create an AWS key pair using the generated RSA key pair
resource "aws_key_pair" "web_key_pair" {
  key_name   = "web_key_pair"
  public_key = local_file.web_public_key.content
}

resource "tls_private_key" "logic_key_pair_gen" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Save the public key to a local file
resource "local_file" "logic_public_key" {
  content  = tls_private_key.logic_key_pair_gen.public_key_openssh
  filename = "${path.module}/logic_key.pub"

  depends_on = [tls_private_key.logic_key_pair_gen]
}

# Create an AWS key pair using the generated RSA key pair
resource "aws_key_pair" "logic_key_pair" {
  key_name   = "logic_key_pair"
  public_key = local_file.logic_public_key.content
}


# Define launch template for EC2 instances
resource "aws_launch_template" "web_ec2_lt" {
  name_prefix   = "web-"
  description   = "Web facing EC2 instance launch template"
  image_id      = var.ami
  instance_type = var.instance_type
  user_data     = var.user_data_web

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.security_group_web]
  }

  key_name = aws_key_pair.web_key_pair.id
}

resource "aws_launch_template" "logic_ec2_lt" {
  name_prefix   = "logic-"
  description   = "Internal facing EC2 instance launch template"
  image_id      = var.ami
  instance_type = var.instance_type
  user_data     = var.user_data_logic

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [var.security_group_logic]
  }

  key_name = aws_key_pair.logic_key_pair.id
}

# Create an autoscaling group for EC2 instances
resource "aws_autoscaling_group" "web_asg" {
  max_size            = 5
  min_size            = 2
  desired_capacity    = 4
  vpc_zone_identifier = [var.public_subnet_1_id, var.public_subnet_2_id]

  launch_template {
    id      = aws_launch_template.web_ec2_lt.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_group" "logic_asg" {
  max_size            = 5
  min_size            = 2
  desired_capacity    = 4
  vpc_zone_identifier = [var.private_subnet_1_id, var.private_subnet_2_id]

  launch_template {
    id      = aws_launch_template.logic_ec2_lt.id
    version = "$Latest"
  }
}
