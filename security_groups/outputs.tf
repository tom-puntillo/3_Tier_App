#---security_groups-outputs.tf

# Output for the HTTP security group, providing its ID.
output "security_group_http" {
  value = aws_security_group.allow_http.id
}

# Output for the TLS (HTTPS) security group, providing its ID.
output "security_group_tls" {
  value = aws_security_group.allow_tls.id
}
