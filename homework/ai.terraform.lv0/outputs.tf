output "public_instance_ip" {
  description = "Public IP address of the public EC2 instance."
  value       = aws_instance.public.public_ip
}

output "private_instance_private_ip" {
  description = "Private IP address of the private EC2 instance."
  value       = aws_instance.private.private_ip
}

output "database_instance_private_ip" {
  description = "Private IP address of the database EC2 instance."
  value       = aws_instance.database.private_ip
}
