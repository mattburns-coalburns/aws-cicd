variable "base_name" {
  type        = string
  description = "The base name for all resources"
}

variable "cc_push_sns_arn" {
  description = "The ARN of the CodeCommit SNS Topic"
}