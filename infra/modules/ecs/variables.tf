variable "ecs_cpu" {
  description = "CPU units for ECS task"
  type        = number
}

variable "ecs_memory" {
  description = "Memory (MiB) for ECS task"
  type        = number
}

variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "ecs_security_group_id" {
  description = "Security Group ID for ECS"
  type        = string
}

variable "container_name" {
  description = "Container name"
  type        = string
}

variable "container_image" {
  description = "Docker image"
  type        = string
}

variable "container_port" {
  description = "Container port"
  type        = number
}

variable "target_group_arn" {
  description = "ALB Target Group ARN"
  type        = string
}
