resource "aws_codecommit_repository" "main" {
  repository_name = "${var.base_name}-codecommit-main"
  description     = "This is the main CodeCommit Repository"
  default_branch  = "master"
}

# resource "aws_codecommit_trigger" "main" {
#   repository_name = aws_codecommit_repository.main.repository_name

#   trigger {
#     name            = "all"
#     events          = ["all"]
#     destination_arn = var.cc_push_sns_arn
#   }
# }