resource "aws_sns_topic" "codecommit_push" {
  name = "${var.base_name}-codecommit-push"
}

resource "aws_sns_topic_subscription" "codecommit_push" {
  topic_arn = aws_sns_topic.codecommit_push.arn
  protocol  = "sqs"
  endpoint  = var.cc_push_endpoint
}