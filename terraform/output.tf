output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "runner_public_ip" {
  value = aws_instance.gha_runner.public_ip
}

output "ecr_repo_url" {
  value = aws_ecr_repository.npm_app.repository_url
}
