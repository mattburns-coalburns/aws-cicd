resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
}

#------------------ EC2 -------------------

# Generates a secure private key and encodes it as PEM
resource "tls_private_key" "ec2" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Provides an EC2 key pair resource
resource "aws_key_pair" "ec2" {
  key_name = join("-", ["${var.base_name}-ec2", random_string.random.result])
  public_key      = tls_private_key.ec2.public_key_openssh
}

# Provides a resource to manage AWS Secrets Manager secret metadata
resource "aws_secretsmanager_secret" "ec2" {
  name = join("-", ["${var.base_name}-ec2", random_string.random.result])
  description = var.description
}

# Provides a resource to manage AWS Secrets Manager secret version including its secret value
resource "aws_secretsmanager_secret_version" "ec2" {
  secret_id     = aws_secretsmanager_secret.ec2.id
  secret_string = tls_private_key.ec2.private_key_pem
}

#------------------ CODECOMMIT -------------------

# Generates a secure private key and encodes it as PEM
resource "tls_private_key" "cc-user" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Provides an cc-user key pair resource
resource "aws_key_pair" "cc-user" {
  key_name = join("-", ["${var.base_name}-codecommit", random_string.random.result])
  public_key      = tls_private_key.cc-user.public_key_openssh
}

# Provides a resource to manage AWS Secrets Manager secret metadata
resource "aws_secretsmanager_secret" "cc-user" {
  name = join("-", ["${var.base_name}-codecommit", random_string.random.result])
  description = var.description
}

# Provides a resource to manage AWS Secrets Manager secret version including its secret value
resource "aws_secretsmanager_secret_version" "cc-user" {
  secret_id     = aws_secretsmanager_secret.cc-user.id
  secret_string = tls_private_key.cc-user.private_key_pem
}