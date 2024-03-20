#---ec2-variables.tf

# Define a variable named "ami" with type string and a default value of "ami-0005e0cfe09cc9050".
variable "ami" {
  type    = string
  default = "ami-0005e0cfe09cc9050"
}

# Define a variable named "instance_type" with type string and a default value of "t2.micro".
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

# Define a variable named "user_data" with type string and a default value containing encoded shell script for initializing the instance.
variable "user_data" {
  type    = string
  default = "IyEvYmluL2Jhc2gKCnN1ZG8geXVtIHVwZGF0ZSAteQpzdWRvIHl1bSB1cGdyYWRlIC15CnN1ZG8geXVtIGluc3RhbGwgbmdpbnggLXkKc3VkbyBzeXN0ZW1jdGwgc3RhcnQgbmdpbngKc3VkbyBzeXN0ZW1jdGwgZW5hYmxlIG5naW54Cg=="
}

# Define a variable named "security_groups" which expects a list of strings.
variable "security_groups" {
  type        = list(string)              # Specify that the variable should be a list of strings.
  description = "List of security groups" # Provide a description for the variable.
}

# Define variables for subnet IDs
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
