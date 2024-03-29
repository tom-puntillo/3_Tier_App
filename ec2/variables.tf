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
variable "user_data_web" {
  type    = string
  default = "IyEvYmluL2Jhc2gKCnN1ZG8geXVtIHVwZGF0ZSAteQpzdWRvIHl1bSB1cGdyYWRlIC15CnN1ZG8geXVtIGluc3RhbGwgbmdpbnggLXkKc3VkbyBzeXN0ZW1jdGwgc3RhcnQgbmdpbngKc3VkbyBzeXN0ZW1jdGwgZW5hYmxlIG5naW54Cg=="
}

variable "user_data_logic" {
  type    = string
  default = "IyEvYmluL2Jhc2gKCnN1ZG8geXVtIHVwZGF0ZSAteQpzdWRvIHl1bSB1cGdyYWRlIC15CnN1ZG8geXVtIGluc3RhbGwgLXkgZ2NjLWMrKyBtYWtlIApjdXJsIC1zTCBodHRwczovL3JwbS5ub2Rlc291cmNlLmNvbS9zZXR1cF8yMC54IHwgc3VkbyAtRSBiYXNoIC0Kc3VkbyB5dW0gaW5zdGFsbCAteSBub2RlanMK"
}

# Define a variable named "security_groups" which expects a list of strings.
variable "security_group_web" {
  type        = string               # Specify that the variable should be a list of strings.
  description = "Web security group" # Provide a description for the variable.
}

variable "security_group_logic" {
  type        = string                 # Specify that the variable should be a list of strings.
  description = "Logic security group" # Provide a description for the variable.
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