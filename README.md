# aws-cicd

## Steps
- `terraform init`
- `terraform apply --auto-approve`
- Open terminal on local host
- `vim <*.pem name from ec2_login output>`
- Go to Secrets Manager in AWS console to get key contents, paste into .pem file
- Save and close
- `chmod 400 <*.pem name from ec2_login output>`
- Copy and paste `ec2_login` output to login to ec2 instance
- `vim ~/.ssh/codecommit_rsa`

Link: https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-ssh-unixes.html?icmpid=docs_acc_console_connect_np
