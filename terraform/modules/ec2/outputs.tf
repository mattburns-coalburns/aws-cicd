output "ec2_ssh_pub_ip" {
  value = aws_instance.amazon_linux.public_ip
}