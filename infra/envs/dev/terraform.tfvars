aws_region = "ap-south-1"

vpc_cidr = "10.0.0.0/16"

public_subnet_1_cidr = "10.0.1.0/24"
public_subnet_2_cidr = "10.0.2.0/24"

private_subnet_1_cidr = "10.0.11.0/24"
private_subnet_2_cidr = "10.0.12.0/24"

db_name     = "bookingdb"
db_username = "postgres"
db_password = "Password@123"

db_instance_class = "db.t3.micro"

backup_retention_period = 1

deletion_protection = false

ecs_cpu    = 256
ecs_memory = 512

container_name  = "nginx"
container_image = "nginx:latest"
container_port  = 80