# Create the ECR repositories for the project
resource "aws_ecr_repository" "ecr_repositories" {
  for_each             = toset(var.project_repos)
  name                 = each.key
  image_tag_mutability = "MUTABLE"
  force_delete         = false

  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = true
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name         = each.key
    Project      = ""
    Environment  = var.environment
    ManagedBy    = "terraform"
  }
}
