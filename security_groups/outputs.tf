#---security_groups-outputs.tf

# Output for the HTTP security group, providing its ID.
output "security_group_web" {
  value = aws_security_group.allow_http_and_tls_web.id
}

# Output for the TLS (HTTPS) security group, providing its ID.
output "security_group_logic" {
  value = aws_security_group.allow_http_and_tls_logic.id
}
