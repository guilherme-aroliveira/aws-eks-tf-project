resource "kubernetes_service_account" "eks_controller_sa" {
  metadata {
    name = "aws-load-balancer-controller"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = var.iam_eks_controller_role
    }
  }
}