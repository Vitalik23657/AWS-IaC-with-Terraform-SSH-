output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.cmtr-m0n4rtob-ec2.public_ip
}
