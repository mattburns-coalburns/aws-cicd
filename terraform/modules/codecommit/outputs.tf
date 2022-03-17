output "codecommit_url" {
  value       = aws_codecommit_repository.main.clone_url_http
  description = "The URL to use for cloning the repository over HTTPS"
}