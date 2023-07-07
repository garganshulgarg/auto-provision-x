output "public_ip" {
  value       = aws_instance.setup-apache-on-ec2.public_ip
  description = "AWS EC2 Node Public IP"
}