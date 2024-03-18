#---alb-main.tf

resource "aws_lb" "web_tier_alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.web_subnet_ids
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.web_tier_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type         = "fixed-response"
    status_code  = 200
    content_type = "text/plain"
    message_body = "Welcome to Thomas Puntillo's NGINX landing page"
  }
}

resource "aws_lb_target_group" "http_tg" {
  name        = var.target_group_name
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"
}

data "aws_autoscaling_groups" "web_autoscaling" {
  names = ["web_asg"]
}

resource "aws_lb_target_group_attachment" "web_lb_tg_attachment" {
  target_group_arn = aws_lb_target_group.http_tg.arn
  target_id        = data.aws_autoscaling_groups.web_autoscaling.instances[count.index].id

  count = length(data.aws_autoscaling_groups.web_autoscaling.instances)
}