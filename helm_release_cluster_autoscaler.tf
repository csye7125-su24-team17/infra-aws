resource "helm_release" "cluster_autoscaler" {
  name       = "cluster-autoscaler"
  repository = "https://kubernetes.github.io/autoscaler"
  chart      = "cluster-autoscaler"
  namespace  = "cluster-autoscaler-namespace"
  version    = "9.37.0"

  set {
    name  = "image.tag"
    value = var.cluster_autoscaler_image_tag # Match the version with the chart version
  }

  values = [
    file("${path.module}/values/cluster-autoscaler-values.yaml")
  ]
  depends_on = [kubernetes_namespace.cluster-autoscaler-namespace]
}