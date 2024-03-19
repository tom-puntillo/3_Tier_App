#---ec2-outputs.tf

output "web_asg_name" {
  value = aws_autoscaling_group.web_asg.name
}

output "web_asg_id" {
  value = aws_autoscaling_group.web_asg.id
}

output "ec2_instance_ids" {
  value = aws_autoscaling_group.web_asg.id
}