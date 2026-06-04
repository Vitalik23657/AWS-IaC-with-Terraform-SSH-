output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.cmtr_m0n4rtob_ec2.public_ip
}
