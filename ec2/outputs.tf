#---ec2-outputs.tf

# Output the name of the autoscaling group for EC2 instances
output "web_asg_name" {
  value = aws_autoscaling_group.web_asg.name  # Output the name of the Auto Scaling Group
}

# Output the ID of the autoscaling group for EC2 instances
output "web_asg_id" {
  value = aws_autoscaling_group.web_asg.id    # Output the ID of the Auto Scaling Group
}

# Output the ARN of the autoscaling group for EC2 instances
output "web_asg_arn" {
  value = aws_autoscaling_group.web_asg.arn   # Output the ARN of the Auto Scaling Group
}
