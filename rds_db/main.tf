#---rds-main.tf

# Create a subnet group for the Aurora RDS cluster
resource "aws_db_subnet_group" "aurora_subnet_group" {
  name       = "aurora_subnet_group"                              # Name of the subnet group
  subnet_ids = [var.private_subnet_3_id, var.private_subnet_4_id] # Subnets where RDS instances will be deployed
}

# Create an Aurora RDS cluster
resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier      = "aurora-cluster"                             # Identifier for the Aurora cluster
  engine                  = var.engine                                   # Database engine type (e.g., "aurora", "aurora-mysql")
  engine_version          = var.engine_version                           # Version of the database engine
  database_name           = var.db_name                                  # Name of the initial database
  master_username         = var.master_username                          # Username for the master user
  master_password         = var.master_password                          # Password for the master user
  backup_retention_period = 30                                           # Number of days to retain automatic backups
  preferred_backup_window = "06:00-08:00"                                # Time window for automated backups
  skip_final_snapshot     = true                                         # Whether to skip taking a final snapshot during deletion
  db_subnet_group_name    = aws_db_subnet_group.aurora_subnet_group.name # Reference to the created subnet group
}

# Create an instance within the Aurora RDS cluster
resource "aws_rds_cluster_instance" "aurora_instance" {
  cluster_identifier = aws_rds_cluster.aurora_cluster.id # Reference to the Aurora cluster
  instance_class     = var.db_instance                   # Instance type for the RDS instance
  engine             = var.engine                        # Database engine type
  engine_version     = var.engine_version                # Version of the database engine
  identifier         = "aurora-instance-0"               # Identifier for the RDS instance
}

