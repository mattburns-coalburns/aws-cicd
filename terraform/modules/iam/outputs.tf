output "aws_iam_username" {
  value = aws_iam_user.codecommit.name
}

output "iam_for_lambda" {
  value = aws_iam_role.iam_for_lambda.arn
  
}