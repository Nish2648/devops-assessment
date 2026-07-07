resource "aws_ecs_cluster" "main" {
  name = "devops-ecs-cluster"

  tags = {
    Name = "devops-ecs-cluster"
  }
}