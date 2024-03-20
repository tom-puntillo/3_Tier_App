#---alb-main.tf

# Define Application Load Balancer (ALB) resource
resource "aws_lb" "web_tier_alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = [var.public_subnet_1_id, var.public_subnet_2_id]
}

# Define HTTP listener for ALB
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

# Define target group for ALB to route traffic to EC2 instances
resource "aws_lb_target_group" "http_tg" {
  name        = var.target_group_name
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"
}

resource "aws_autoscaling_attachment" "web_asg_tg_attachment" {
  autoscaling_group_name = var.web_asg_id
  lb_target_group_arn    = aws_lb_target_group.http_tg.arn
}