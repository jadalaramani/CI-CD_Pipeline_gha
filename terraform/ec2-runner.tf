resource "aws_instance" "gha_runner" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = module.vpc.public_subnets[0]
  key_name               = var.key_pair
  associate_public_ip_address = true
  iam_instance_profile   = aws_iam_instance_profile.runner_profile.name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker git
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ec2-user

              # Install GitHub Actions runner
              cd /home/ec2-user
              mkdir actions-runner && cd actions-runner
              curl -o actions-runner-linux-x64-2.317.0.tar.gz -L https://githubactionsrunnerpackage
              tar xzf ./actions-runner-linux-x64-2.317.0.tar.gz

              # Replace with your repo details
              ./config.sh --url https://github.com/YOUR_USERNAME/YOUR_REPO --token YOUR_RUNNER_TOKEN
              ./svc.sh install
              ./svc.sh start
              EOF

  tags = {
    Name = "${var.project_name}-runner"
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}
