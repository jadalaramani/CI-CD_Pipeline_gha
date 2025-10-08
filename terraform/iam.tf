resource "aws_iam_role" "runner_role" {
  name = "${var.project_name}-runner-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = { Service = "ec2.amazonaws.com" },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "runner_policy" {
  name = "runner-policy"
  role = aws_iam_role.runner_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "ecr:*",
          "eks:*",
          "ec2:*",
          "s3:*",
          "logs:*",
          "cloudwatch:*",
          "iam:PassRole"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "runner_profile" {
  name = "${var.project_name}-runner-profile"
  role = aws_iam_role.runner_role.name
}
