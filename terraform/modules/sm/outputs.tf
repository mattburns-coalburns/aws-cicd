output "key_name_ec2" {
  description = "Name of the EC2 keypair"
  value       = aws_key_pair.ec2.key_name
}

output "key_name_codecommit" {
  description = "Name of the codecommit keypair"
  value       = aws_key_pair.cc-user.key_name
}

output "pub_key_codecommit" {
  description = "Public Key for the cc-user IAM User"
  value       = aws_key_pair.cc-user.public_key
}