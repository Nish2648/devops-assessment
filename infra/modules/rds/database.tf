resource "aws_db_instance" "postgres" {

  identifier = "devops-postgres"

  engine         = "postgres"
  engine_version = "16"

  instance_class = var.db_instance_class

  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name = aws_db_subnet_group.main.name

  vpc_security_group_ids = [
    var.rds_security_group_id
  ]

  publicly_accessible = false

  backup_retention_period = var.backup_retention_period

  deletion_protection = var.deletion_protection

  skip_final_snapshot = true

  tags = {
    Name = "devops-postgres"
  }
}