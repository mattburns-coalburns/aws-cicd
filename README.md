# aws-cicd

## Steps
- `terraform init`
- `terraform apply --auto-approve`
- Open terminal on local host
- `vim <*.pem name from ec2_login output>`
- Go to Secrets Manager in AWS console to get ec2 key contents, paste into .pem file
- Save and close
- `chmod 400 <*.pem name from ec2_login output>`
- Copy and paste `ec2_login` output to login to ec2 instance
- `vim ~/.ssh/codecommit_rsa`
- Go to Secrets Manager in AWS console to get codecommit key contents, paste into this file
- `chmod 400 ~/.ssh/codecommit_rsa`
- `vim ~/.ssh/config`
- Copy/Paste (editing User <> value with SSH ID from IAM)
```
Host git-codecommit.*.amazonaws.com
  User <APKAEIBAERJR2EXAMPLE>
  IdentityFile ~/.ssh/codecommit_rsa
```
- Save and close
- `chmod 600 ~/.ssh/config`
- Test SSH configuration: `ssh git-codecommit.us-east-1.amazonaws.com`, `yes`
- `git clone <ssh://git-codecommit.us-east-2.amazonaws.com/v1/repos/MyDemoRepo>`

Link: https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-ssh-unixes.html?icmpid=docs_acc_console_connect_np
