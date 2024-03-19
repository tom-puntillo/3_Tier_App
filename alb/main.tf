#---alb-main.tf

resource "aws_lb" "web_tier_alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = [var.public_subnet_1_id, var.public_subnet_2_id]
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.web_tier_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Welcome to my NGINX page!"
      status_code  = "200"
    }
  }
}

resource "aws_lb_target_group" "http_tg" {
  name        = var.target_group_name
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"
}

resource "aws_lb_target_group_attachment" "web_lb_tg_attachment" {
  target_group_arn = aws_lb_target_group.http_tg.arn
  target_id        = var.ec2_instance_ids

  depends_on = [aws_lb.web_tier_alb]
}
