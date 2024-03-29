#---alb-variables.tf

# Define variables for ALB configuration

variable "web_alb_name" {
  type        = string
  default     = "web-tier-alb"
  description = "Name of the web tier application load balancer"
}

variable "web_target_group_name" {
  type        = string
  default     = "web-alb-tg"
  description = "Name of the web tier instances target group"
}

variable "web_tg_attachment" {
  type        = string
  default     = "web_tg_attachment"
  description = "Name of the web tier target group attachment"
}

variable "logic_alb_name" {
  type        = string
  default     = "logic-tier-alb"
  description = "Name of the logic tier application load balancer"
}

variable "logic_target_group_name" {
  type        = string
  default     = "logic-alb-tg"
  description = "Name of the logic tier instances target group"
}

variable "logic_tg_attachment" {
  type        = string
  default     = "logic_tg_attachment"
  description = "Name of the logic tier target group attachment"
}

# Define input variables for ALB and EC2 configuration

variable "vpc_id" {
  type = string
}

variable "security_group_web" {
  type        = string               # Specify that the variable should be a list of strings.
  description = "Web security group" # Provide a description for the variable.
}

variable "security_group_logic" {
  type        = string                 # Specify that the variable should be a list of strings.
  description = "Logic security group" # Provide a description for the variable.
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

variable "web_asg_name" {
  type        = string
  description = "Name of the web autoscaling group"
}

variable "web_asg_id" {
  type        = string
  description = "ID of the web autoscaling group"
}

variable "web_asg_arn" {
  type        = string
  description = "ARN of the web autoscaling group"
}

variable "logic_asg_name" {
  type        = string
  description = "Name of the logic autoscaling group"
}

variable "logic_asg_id" {
  type        = string
  description = "ID of the logic autoscaling group"
}

variable "logic_asg_arn" {
  type        = string
  description = "ARN of the logic autoscaling group"
}