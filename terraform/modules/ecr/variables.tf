variable "project_repos" {
    description = "List of ECR repositories to create"
    type = list(string)
    default = [
        "prod-repo-1",
        "prod-repo-2",
        "prod-repo-3",
        "prod-repo-4"
    ]
}

variable environment {
    description = "Enviroment for each project (dev, stg, prod)"
    type = string
    default = "prod"
}
