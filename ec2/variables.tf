#---ec2-variables.tf

variable "ami" {
  type    = string
  default = "ami-0005e0cfe09cc9050"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "user_data" {
  type    = string
  default = "IyEvYmluL2Jhc2gKCnN1ZG8geXVtIHVwZGF0ZSAteQpzdWRvIHl1bSB1cGdyYWRlIC15CnN1ZG8geXVtIGluc3RhbGwgbmdpbnggLXkKc3VkbyBzeXN0ZW1jdGwgc3RhcnQgbmdpbngKc3VkbyBzeXN0ZW1jdGwgZW5hYmxlIG5naW54Cg=="
}

# Define a variable named "security_groups" which expects a list of strings.
variable "security_groups" {
  type        = list(string)              # Specify that the variable should be a list of strings.
  description = "list of security groups" # Provide a description for the variable.
}
