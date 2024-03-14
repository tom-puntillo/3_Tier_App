#---vpc-variables.tf

# Define input variables for subnet CIDR blocks with default values

variable "public_subnet_1" {
  type    = string        # Specify the data type of the variable as string
  default = "10.0.1.0/24" # Set a default value for the variable
}

variable "public_subnet_2" {
  type    = string
  default = "10.0.2.0/24"
}

variable "private_subnet_1" {
  type    = string
  default = "10.0.3.0/24"
}

variable "private_subnet_2" {
  type    = string
  default = "10.0.4.0/24"
}

variable "private_subnet_3" {
  type    = string
  default = "10.0.5.0/24"
}

variable "private_subnet_4" {
  type    = string
  default = "10.0.6.0/24"
}
