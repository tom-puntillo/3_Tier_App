#---security-groups-variables.tf

# Define an input variable named "vpc_id" of type string
variable "vpc_id" {
  type = string # Specify the data type of the variable as string
}

# Define an input variable named "allowed_ip" of type string with a default value
variable "allowed_ip" {
  type    = string            # Specify the data type of the variable as string
  default = "73.0.169.120/32" # Set a default value for the variable
}
