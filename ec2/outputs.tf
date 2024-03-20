#---ec2-outputs.tf

# Output the name of the autoscaling group for EC2 instances
output "web_asg_name" {
  value = aws_autoscaling_group.web_asg.name
}

# Output the ID of the autoscaling group for EC2 instances
output "web_asg_id" {
  value = aws_autoscaling_group.web_asg.id
}

# Output the IDs of the EC2 instances in the autoscaling group
output "ec2_instance_ids_0" {
  value = data.aws_instances.web_asg_ec2_instances.ids[0]
}

output "ec2_instance_ids_1" {
  value = data.aws_instances.web_asg_ec2_instances.ids[1]
}

output "ec2_instance_ids_2" {
  value = data.aws_instances.web_asg_ec2_instances.ids[2]
}

output "ec2_instance_ids_3" {
  value = data.aws_instances.web_asg_ec2_instances.ids[3]
}
