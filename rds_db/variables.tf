#---rds-variables.tf

variable "private_subnet_3_id" {
  type        = string
  description = "ID of the third private subnet"
}

variable "private_subnet_4_id" {
  type        = string
  description = "ID of the fourth private subnet"
}

variable "master_username" {
  type    = string
  default = "admin"
}

variable "master_password" {
  type    = string
  default = "WelcomeRDS1234!"
}

variable "db_name" {
  type    = string
  default = "aurora_db"
}

variable "db_instance" {
  type    = string
  default = "db.t3.medium"
}

variable "engine" {
  type    = string
  default = "aurora-mysql"
}

variable "engine_version" {
  type    = string
  default = "5.7.mysql_aurora.2.07.2"
}