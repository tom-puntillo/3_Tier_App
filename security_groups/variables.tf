#---security-groups-variables.tf

# Define an input variable named "vpc_id" of type string
variable "vpc_id" {
  type = string # Specify the data type of the variable as string
}

variable "allowed_ip" {
  type    = string
  default = "73.0.169.120/32"
}