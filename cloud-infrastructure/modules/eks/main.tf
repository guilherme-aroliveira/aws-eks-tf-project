# Create the EKS cluster
resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks-cluster"
  role_arn = var.iam_cluster_role

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access = true

    subnet_ids = var.public_subnets
  }

  depends_on = [
    var.iam_eks_role_attach
  ]

  tags = {

  }
}

# Create the EKS OIDC certificate
data "tls_certificate" "eks_oidc_tls_certificate" {
  url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

# Create do EKS Managed Node Group
resource "aws_eks_node_group" "eks_managed_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "eks-nodegroup"
  node_role_arn   = var.iam_eks_mgn
  subnet_ids      = var.private_subnets

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  depends_on = [
    var.iam_mgn_worker_attach,
    var.iam_mgn_ecr_attach,
    var.iam_mgn_cni_attach,
  ]

  tags = {
    
  }
}