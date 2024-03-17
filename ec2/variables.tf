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
  description = "list of security groups" # Provide a description for the variable.
}

variable "public_subnet_1" {
  type        = string
  description = "public_subnet_1"
}

variable "public_subnet_2" {
  type        = string
  description = "public_subnet_2"
}

variable "private_subnet_1" {
  type        = string
  description = "private_subnet_1"
}

variable "private_subnet_2" {
  type        = string
  description = "private_subnet_2"
}

variable "private_subnet_3" {
  type        = string
  description = "private_subnet_3"
}

variable "private_subnet_4" {
  type        = string
  description = "private_subnet_4"
}