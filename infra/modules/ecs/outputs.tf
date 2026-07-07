output "execution_role_arn" {
  value = aws_iam_role.ecs_task_execution_role.arn
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "ecs_service_name" {
  value = aws_ecs_service.main.name
}

output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.main.arn
}