# IAM role for Managed Node Group
resource "aws_iam_role" "eks_mng_role" {
  name = "eks-mng-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "mng-role"
  }
}

# Create policies attachments for managed node group
resource "aws_iam_role_policy_attachment" "eks_mgn_role_worker" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_mgn_role_attach_ecr" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role_policy_attachment" "eks_mgn_role_attach_cni" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}