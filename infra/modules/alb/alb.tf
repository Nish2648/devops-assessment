resource "aws_lb" "main" {
  name               = "devops-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    var.alb_security_group_id
  ]

  subnets = var.public_subnet_ids

  tags = {
    Name = "devops-alb"
  }
}