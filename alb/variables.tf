#---alb-variables.tf

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

# Define an input variable named "vpc_id" of type string
variable "vpc_id" {
  type = string # Specify the data type of the variable as string
}

# Define a variable named "security_groups" which expects a list of strings.
variable "security_groups" {
  type        = list(string)              # Specify that the variable should be a list of strings.
  description = "list of security groups" # Provide a description for the variable.
}

variable "public_subnet_1_id" {
  type        = string
  description = "public_subnet_1"
}

variable "public_subnet_2_id" {
  type        = string
  description = "public_subnet_2"
}

variable "private_subnet_1_id" {
  type        = string
  description = "private_subnet_1"
}

variable "private_subnet_2_id" {
  type        = string
  description = "private_subnet_2"
}

variable "private_subnet_3_id" {
  type        = string
  description = "private_subnet_3"
}

variable "private_subnet_4_id" {
  type        = string
  description = "private_subnet_4"
}

variable "web_asg_name" {
  type        = string
  description = "Name of web asg"
}

variable "web_asg_id" {
  type        = string
  description = "Web asg id"
}