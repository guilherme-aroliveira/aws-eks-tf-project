module "vpc" {
  source = "../../modules/vpc"
  environment = "dev"
}

module "iam" {
  source = "../../modules/iam"
  oidc = module.eks.oidc
  eks_cluster = module.eks.eks_cluster
}

module "ec2" {
  source = "../../modules/ec2"
  eks_cluster = module.eks.eks_cluster
}

module "ecr" {
  source = "../../modules/ecr"
  environment = "dev"
}

module "eks" {
  source = "../../modules/eks"
  iam_cluster_role = module.iam.iam_cluster_role
  iam_eks_mgn = module.iam.iam_eks_mgn
  iam_eks_role_attach = module.iam.iam_eks_role_attach
  iam_mgn_worker_attach = module.iam.iam_mgn_worker_attach
  iam_mgn_ecr_attach = module.iam.iam_mgn_ecr_attach
  iam_mgn_cni_attach = module.iam.iam_mgn_cni_attach
  public_subnets = values(module.vpc.public_subnets)
  private_subnets = values(module.vpc.private_subnets)
} 

module "k8s" {
  source = "../../modules/k8s"
  iam_eks_controller_role = module.iam.iam_eks_controller_role
}

module "helm" {
  source = "../../modules/helm"
  eks_cluster_name = module.eks.eks_cluster_name
}


