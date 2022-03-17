variable "base_name" {
  type        = string
  description = "The base name for all resources"
}

variable "iam_for_lambda" {
  description = "IAM Role for Lambda"
}