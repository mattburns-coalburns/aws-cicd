module "vpc" {
  source    = "./modules/vpc"
  base_name = var.base_name
}

module "sm" {
  source    = "./modules/sm"
  base_name = var.base_name
}

module "codecommit" {
  source    = "./modules/codecommit"
  base_name = var.base_name
  cc_push_sns_arn = module.sns.cc_push_sns_arn
}

module "iam" {
  source             = "./modules/iam"
  base_name          = var.base_name
  pub_key_codecommit = module.sm.pub_key_codecommit
}

module "sns" {
  source    = "./modules/sns"
  base_name = var.base_name
  cc_push_endpoint = module.sqs.cc_push_sqs_arn
}

module "sqs" {
  source    = "./modules/sqs"
  base_name = var.base_name
}

# Invokes EC2 instance that serves as an administrative server
module "ec2" {
  source    = "./modules/ec2"
  base_name = var.base_name
  sub2_id   = module.vpc.sub2
  # sub3_id              = module.vpc.sub3
  # sub4_id              = module.vpc.sub4
  pub_ssh_sg = module.vpc.pub_ssh_sg
  # pub_http_sg          = module.vpc.pub_http_sg
  # pri_http_sg          = module.vpc.pri_http_sg
  # alb_target_group_arn = module.vpc.alb_target_group_arn
  key_name_ec2 = module.sm.key_name_ec2
}

# # Invokes KMS module (Used to encrypt S3 bucket)
# module "kms" {
#   source = "./modules/kms"
# }

# # Invokes S3 module
# module "s3" {
#   source      = "./modules/s3"
#   base_name   = var.base_name
#   kms_key_arn = module.kms.kms_key_arn
# }