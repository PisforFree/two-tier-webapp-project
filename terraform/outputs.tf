output "frontend_public_ip" {
  description = "Public IP address of the frontend EC2 instance"
  value       = aws_instance.frontend.public_ip
}

output "frontend_public_dns" {
  description = "Public DNS name of the frontend EC2 instance"
  value       = aws_instance.frontend.public_dns
}

output "database_private_ip" {
  description = "Private IP address of the database EC2 instance"
  value       = aws_instance.database.private_ip
}
