resource "aws_ecr_repository" "app" {
  name = "${var.project_name}-ecr"

  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "MUTABLE"
}
