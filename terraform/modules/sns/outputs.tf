output "cc_push_sns_arn" {
    value = aws_sns_topic.codecommit_push.arn
}