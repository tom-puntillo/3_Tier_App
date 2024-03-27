#---alb-main.tf

# Define Application Load Balancer (ALB) resource
resource "aws_lb" "web_tier_alb" {
  name               = var.web_alb_name                                 # Set the name of the ALB from the input variable
  internal           = false                                            # Specifies whether the ALB is internal or not
  load_balancer_type = "application"                                    # Specify the type of load balancer as application
  security_groups    = [var.security_group_web]                         # List of security groups associated with the ALB
  subnets            = [var.public_subnet_1_id, var.public_subnet_2_id] # List of subnets for the ALB
}

# Define HTTP listener for ALB
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.web_tier_alb.arn # Set the ARN of the ALB
  port              = 80                      # Specify the port for HTTP traffic
  protocol          = "HTTP"                  # Specify the protocol as HTTP

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http_tg.arn
  }
}

# Define target group for ALB to route traffic to EC2 instances
resource "aws_lb_target_group" "http_tg" {
  name        = var.web_target_group_name # Set the name of the target group from the input variable
  port        = 80                        # Specify the port for the target group
  protocol    = "HTTP"                    # Specify the protocol as HTTP
  vpc_id      = var.vpc_id                # Set the VPC ID for the target group
  target_type = "instance"                # Specify the target type as EC2 instances
}

# Attach ALB target group to Auto Scaling Group
resource "aws_autoscaling_attachment" "web_asg_tg_attachment" {
  autoscaling_group_name = var.web_asg_id                  # Set the name of the Auto Scaling Group from input variable
  lb_target_group_arn    = aws_lb_target_group.http_tg.arn # Set the target group ARN to attach to the Auto Scaling Group
}

resource "aws_lb" "logic_tier_alb" {
  name               = var.logic_alb_name                                 # Set the name of the ALB from the input variable
  internal           = true                                               # Specifies whether the ALB is internal or not
  load_balancer_type = "application"                                      # Specify the type of load balancer as application
  security_groups    = [var.security_group_logic]                         # List of security groups associated with the ALB
  subnets            = [var.private_subnet_1_id, var.private_subnet_2_id] # List of subnets for the ALB
}

resource "aws_lb_listener" "http_listener_logic" {
  load_balancer_arn = aws_lb.logic_tier_alb.arn # Set the ARN of the ALB
  port              = 80                        # Specify the port for HTTP traffic
  protocol          = "HTTP"                    # Specify the protocol as HTTP

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http_logic_tg.arn
  }
}

resource "aws_lb_target_group" "http_logic_tg" {
  name        = var.logic_target_group_name # Set the name of the target group from the input variable
  port        = 80                          # Specify the port for the target group
  protocol    = "HTTP"                      # Specify the protocol as HTTP
  vpc_id      = var.vpc_id                  # Set the VPC ID for the target group
  target_type = "instance"                  # Specify the target type as EC2 instances
}

# Attach ALB target group to Auto Scaling Group
resource "aws_autoscaling_attachment" "logic_asg_tg_attachment" {
  autoscaling_group_name = var.logic_asg_id                      # Set the name of the Auto Scaling Group from input variable
  lb_target_group_arn    = aws_lb_target_group.http_logic_tg.arn # Set the target group ARN to attach to the Auto Scaling Group
}
