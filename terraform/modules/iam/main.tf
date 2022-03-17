data "aws_iam_policy" "codecommit" {
  arn = "arn:aws:iam::aws:policy/AWSCodeCommitFullAccess"
}

resource "aws_iam_user" "codecommit" {
  name          = "cc-user"
  path          = "/system/"
  force_destroy = true
}

resource "aws_iam_user_ssh_key" "codecommit" {
  username   = aws_iam_user.codecommit.name
  encoding   = "SSH"
  public_key = var.pub_key_codecommit
}

resource "aws_iam_user_policy_attachment" "codecommit" {
  user       = aws_iam_user.codecommit.name
  policy_arn = data.aws_iam_policy.codecommit.arn
}