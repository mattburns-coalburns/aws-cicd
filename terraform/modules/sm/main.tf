# Generates a secure private key and encodes it as PEM
resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Provides an EC2 key pair resource
resource "aws_key_pair" "keypair" {
  key_name = "${var.base_name}-key"
  public_key      = tls_private_key.key.public_key_openssh
}

# Provides a resource to manage AWS Secrets Manager secret metadata
resource "aws_secretsmanager_secret" "secret_key" {
  name = "${var.base_name}-key"
  description = var.description
}

# Provides a resource to manage AWS Secrets Manager secret version including its secret value
resource "aws_secretsmanager_secret_version" "secret_key_value" {
  secret_id     = aws_secretsmanager_secret.secret_key.id
  secret_string = tls_private_key.key.private_key_pem
}