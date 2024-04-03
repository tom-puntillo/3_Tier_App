#---ec2-outputs.tf

# Output the name of the autoscaling group for web EC2 instances
output "web_asg_name" {
  value = aws_autoscaling_group.web_asg.name # Output the name of the Auto Scaling Group for web instances
}

# Output the ID of the autoscaling group for web EC2 instances
output "web_asg_id" {
  value = aws_autoscaling_group.web_asg.id # Output the ID of the Auto Scaling Group for web instances
}

# Output the ARN of the autoscaling group for web EC2 instances
output "web_asg_arn" {
  value = aws_autoscaling_group.web_asg.arn # Output the ARN of the Auto Scaling Group for web instances
}

# Output the name of the autoscaling group for logic EC2 instances
output "logic_asg_name" {
  value = aws_autoscaling_group.logic_asg.name # Output the name of the Auto Scaling Group for logic instances
}

# Output the ID of the autoscaling group for logic EC2 instances
output "logic_asg_id" {
  value = aws_autoscaling_group.logic_asg.id # Output the ID of the Auto Scaling Group for logic instances
}

# Output the ARN of the autoscaling group for logic EC2 instances
output "logic_asg_arn" {
  value = aws_autoscaling_group.logic_asg.arn # Output the ARN of the Auto Scaling Group for logic instances
}
