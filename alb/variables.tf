#---alb-variables.tf

# Define variables for ALB configuration

variable "alb_name" {
  type        = string
  default     = "web-tier-alb"
  description = "Name of the web tier application load balancer"
}

variable "target_group_name" {
  type        = string
  default     = "web-alb-tg"
  description = "Name of the web tier instances target group"
}

variable "web_tg_attachment" {
  type        = string
  default     = "web_tg_attachment"
  description = "Name of the web tier target group attachment"
}

# Define input variables for ALB and EC2 configuration

variable "vpc_id" {
  type = string
}

variable "security_groups" {
  type        = list(string)
  description = "List of security groups"
}

variable "public_subnet_1_id" {
  type        = string
  description = "ID of the first public subnet"
}

variable "public_subnet_2_id" {
  type        = string
  description = "ID of the second public subnet"
}

variable "private_subnet_1_id" {
  type        = string
  description = "ID of the first private subnet"
}

variable "private_subnet_2_id" {
  type        = string
  description = "ID of the second private subnet"
}

variable "private_subnet_3_id" {
  type        = string
  description = "ID of the third private subnet"
}

variable "private_subnet_4_id" {
  type        = string
  description = "ID of the fourth private subnet"
}

variable "web_asg_name" {
  type        = string
  description = "Name of the web autoscaling group"
}

variable "web_asg_id" {
  type        = string
  description = "ID of the web autoscaling group"
}

variable "ec2_instance_ids" {
  type        = list(string)
  description = "ID of the first EC2 instance"
}