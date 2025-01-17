data "aws_caller_identity" "eks_account" {}

data "aws_region" "current" {} 

data "tls_certificate" "eks_oidc_tls_certificate" {
  url = var.eks_cluster.identity[0].oidc[0].issuer
}