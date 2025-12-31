resource "aws_ecr_repository" "npm_app" {
  name                 = "${var.project_name}-repo"
  image_tag_mutability = "MUTABLE"

  lifecycle_policy {
    policy = jsonencode({
      rules = [
        {
          rulePriority = 1
          description  = "Expire old images"
          action       = { type = "expire" }
          selection    = {
            tagStatus = "any"
            countType = "imageCountMoreThan"
            countNumber = 10
          }
        }
      ]
    })
  }
}


