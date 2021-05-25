provider "helm" {
  kubernetes {
    config_context = var.k8s_context
    config_path    = var.k8s_kubeconfig
  }
}


# helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
# helm repo update
# helm search repo -l ingress-nginx  # before helm search repo -l nginx-ingress
resource "helm_release" "ingress-nginx" {
  count            = var.install ? 1 : 0
  name             = "ingress-nginx"
  namespace        = var.namespace
  create_namespace = true
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  version          = "3.29.0"
  timeout          = 300

  set {
    type  = "string"
    name  = "controller.publishService.enabled"
    value = var.publish_service_enabled
  }
}


