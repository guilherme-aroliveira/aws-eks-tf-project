# Controller Role
resource "aws_iam_role" "eks_controller_role" {
  name = "eks-lb-controller-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::${data.aws_caller_identity.eks_account.account_id}:oidc-provider/oidc.eks.${data.aws_region.current.name}.amazonaws.com/id/${local.oidc}"
        }
        Condition = {
          StringEquals = {
            "oidc.eks.${data.aws_region.current.name}.amazonaws.com/id/${local.oidc}:aud" : "sts.amazonaws.com",
            "oidc.eks.${data.aws_region.current.name}.amazonaws.com/id/${local.oidc}:sub" : "system:serviceaccount:kube-system:aws-load-balancer-controller"
          }
        }
      }
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}


# Create the iam policy for the EKS Controller
resource "aws_iam_policy" "eks_controller_policy" {
  name        = "eks-lb-controller"
  description = "EKS LB controller policy"
  policy = file("${path.module}/iam_policy.json")

  tags = {

  }
}

# Create iam policy attachment for the EKS Controller
resource "aws_iam_role_policy_attachment" "eks_controller_role_attachment" {
  role = aws_iam_role.eks_controller_role.name
  policy_arn = aws_iam_policy.eks_controller_policy.arn
}