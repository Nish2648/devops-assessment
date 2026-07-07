variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for the first public subnet"
  type        = string
}
variable "public_subnet_2_cidr" {
  description = "CIDR block for the second public subnet"
  type        = string
}
variable "private_subnet_1_cidr" {
  description = "CIDR block for the first private subnet"
  type        = string
}
variable "private_subnet_2_cidr" {
  description = "CIDR block for the second private subnet"
  type        = string
}
variable "aws_region" {
  description = "AWS region where the VPC will be created"
  type        = string
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "db_instance_class" {
  type = string
}

variable "backup_retention_period" {
  type = number
}

variable "deletion_protection" {
  type = bool
}

variable "ecs_cpu" {
  type = number
}

variable "ecs_memory" {
  type = number
}

variable "container_name" {
  type = string
}

variable "container_image" {
  type = string
}

variable "container_port" {
  type = number
}