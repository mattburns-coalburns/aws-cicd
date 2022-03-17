variable "base_name" {
  type        = string
  description = "The base name for the resource"
}

variable "cc_push_endpoint" {
    description = "The ARN of the CodeCommit SQS Subscriber"  
}