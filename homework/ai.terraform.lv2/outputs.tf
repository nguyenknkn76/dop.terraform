output "public_instance_ip" {
  description = "Public IP address of the public instance"
  value       = aws_instance.public.public_ip
}
