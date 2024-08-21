resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  namespace  = "llm-namespace"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.11.2"

  values = [
    file("${path.module}/values/ingress-nginx-values.yaml")
  ]

  depends_on = [kubernetes_namespace.llm-namespace]
}