#---rds-main.tf

resource "aws_db_subnet_group" "aurora_subnet_group" {
  name       = "aurora_subnet_group"
  subnet_ids = [var.private_subnet_3_id, var.private_subnet_4_id]
}

resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier      = "aurora-cluster"
  engine                  = var.engine
  engine_version          = var.engine_version
  database_name           = var.db_name
  master_username         = var.master_username
  master_password         = var.master_password
  backup_retention_period = 30
  preferred_backup_window = "06:00-08:00"
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_db_subnet_group.aurora_subnet_group.name
}

resource "aws_rds_cluster_instance" "aurora_instance" {
  cluster_identifier = aws_rds_cluster.aurora_cluster.id
  instance_class     = var.db_instance
  engine             = var.engine
  engine_version     = var.engine_version
  identifier         = "aurora-instance-0"
}
