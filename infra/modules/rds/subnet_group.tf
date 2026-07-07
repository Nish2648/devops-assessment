resource "aws_db_subnet_group" "main" {
  name       = "devops-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "devops-db-subnet-group"
  }
}