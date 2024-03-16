#---ec2-main.

resource "tls_private_key" "web_key_pair_gen" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_file" "web_public_key" {
  content  = tls_private_key.web_key_pair_gen.public_key_openssh
  filename = "${path.module}/web_key.pub"
}

resource "aws_key_pair" "web_key_pair" {
  key_name   = "web_key_pair"
  public_key = local_file.web_public_key.content
}

resource "aws_launch_template" "web_ec2_lt" {
  name_prefix   = "web-"
  description   = "Web facing EC2 instance launch template"
  image_id      = var.ami
  instance_type = var.instance_type
  user_data     = var.user_data

  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = var.public_subnet_1
    security_groups             = var.security_groups

  }

  key_name = aws_key_pair.web_key_pair.id
}