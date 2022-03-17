resource "aws_sqs_queue" "codecommit_push" {
  name = "${var.base_name}-codecommit-push"
}