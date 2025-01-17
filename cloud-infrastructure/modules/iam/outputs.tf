output "iam_cluster_role" {
  description = "Output the ID for the primary VPC"
	value = aws_iam_role.esk_cluster_role.arn
}

output "iam_eks_controller_role" {
  description = ""
  value = aws_iam_role.eks_controller_role.arn
}

output "iam_eks_mgn" {
  description = ""
  value = aws_iam_role.eks_mng_role.arn
}

output "iam_eks_role_attach" {
  description = ""
  value = aws_iam_role_policy_attachment.eks_role_attach
}

output "iam_mgn_worker_attach" {
  description = ""
  value = aws_iam_role_policy_attachment.eks_mgn_role_worker
}

output "iam_mgn_ecr_attach" {
  description = ""
  value = aws_iam_role_policy_attachment.eks_mgn_role_attach_ecr
}

output "iam_mgn_cni_attach" {
  description = ""
  value = aws_iam_role_policy_attachment.eks_mgn_role_attach_cni
}