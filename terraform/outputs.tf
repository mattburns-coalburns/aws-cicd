output "codecommit_url" {
  value = module.codecommit.codecommit_url
}

output "codecommit_iam_user" {
    value = module.iam.aws_iam_username
}

output "ec2_login" {
  value = "ssh -i ${module.sm.key_name_ec2}.pem ec2-user@${module.ec2.ec2_ssh_pub_ip}"
}

output "codecommit_key_filename" {
  value = "${module.sm.key_name_codecommit}.pem"
}

# output "alb_dns_name" {
#   value = join(": ", ["Try navigating to this in a web browser", module.vpc.alb_dns_name])
# }