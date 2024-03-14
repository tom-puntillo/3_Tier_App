#---ec2-variables.tf

# Define a variable named "security_groups" which expects a list of strings.
variable "security_groups" {
  type        = list(string)              # Specify that the variable should be a list of strings.
  description = "list of security groups" # Provide a description for the variable.
}
