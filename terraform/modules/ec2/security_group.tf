# Create security group rule for the EKS cluster
resource "aws_security_group_rule" "eks_cluster_sg_rule" {
  type      = "ingress"
  from_port = 443
  to_port   = 443
  protocol  = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]

  security_group_id = var.eks_cluster.vpc_config[0].cluster_security_group_id
}
