variable "iam_cluster_role" {}
variable "iam_eks_mgn" {}
variable "iam_eks_role_attach" {}
variable "iam_mgn_worker_attach" {}
variable "iam_mgn_ecr_attach" {}
variable "iam_mgn_cni_attach" {}
variable "public_subnets" {
  description = "Public subnet IDs" 
  type = set(string)
}
variable "private_subnets" {
  description = "Private subnet IDs" 
  type = set(string)
}