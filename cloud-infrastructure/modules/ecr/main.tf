# Create the ECR repositories for the project
resource "aws_ecr_repository" "climas_ecr_repositories" {
    for_each = toset(var.project_repos)
    name                 = each.key
    image_tag_mutability = "MUTABLE"
    force_delete = false
    
    encryption_configuration {
        encryption_type = "AES256"
    }

    image_scanning_configuration {
        scan_on_push = true
    }

    lifecycle { 
        prevent_destroy = true 
    }

    tags = {
        Name = each.key
        Organization = "waycarbon"
        Project = ""
        Environment = var.environment
        ManagedBy = "terraform"
    }
}
