resource "kubernetes_namespace" "kafka" {
  metadata {
    name = "kafka-namespace"
  }

  depends_on = [module.eks, null_resource.kubeconfig]
}

resource "kubernetes_namespace" "cve-processor" {
  metadata {
    name = "cve-processor-namespace"
  }

  depends_on = [module.eks, null_resource.kubeconfig]
}

resource "kubernetes_namespace" "cve-consumer" {
  metadata {
    name = "cve-consumer-namespace"
  }

  depends_on = [module.eks, null_resource.kubeconfig]
}

# Namespace for Cluster Autoscaler
resource "kubernetes_namespace" "cluster-autoscaler-namespace" {
  metadata {
    name = "cluster-autoscaler-namespace"
  }

  depends_on = [module.eks, null_resource.kubeconfig]
}
resource "kubernetes_namespace" "operator-namespace" {
  metadata {
    name = "operator-namespace"
  }

  depends_on = [module.eks, null_resource.kubeconfig]
}