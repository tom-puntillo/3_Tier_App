#---rds-variables.tf

# ID of the third private subnet
variable "private_subnet_3_id" {
  type        = string
  description = "ID of the third private subnet"
}

# ID of the fourth private subnet
variable "private_subnet_4_id" {
  type        = string
  description = "ID of the fourth private subnet"
}

# Username for the master user of the RDS cluster
variable "master_username" {
  type    = string
  default = "admin" # Default username for the master user
}

# Password for the master user of the RDS cluster
variable "master_password" {
  type    = string
  default = "WelcomeRDS1234!" # Default password for the master user
}

# Name of the initial database in the RDS cluster
variable "db_name" {
  type    = string
  default = "aurora_db" # Default name of the initial database
}

# Instance type for the RDS cluster
variable "db_instance" {
  type    = string
  default = "db.t3.medium" # Default instance type for the RDS cluster
}

# Database engine type (e.g., "aurora", "aurora-mysql")
variable "engine" {
  type    = string
  default = "aurora-mysql" # Default database engine type
}

# Version of the database engine
variable "engine_version" {
  type    = string
  default = "8.0" # Default version of the database engine
}
