#---security_groups-outputs.tf

# Output for the HTTP security group, providing its ID.
output "security_group_http" {
  value = aws_security_group.allow_http
}

output "security_group_tls" {
  value = aws_security_group.allow_tls
}
