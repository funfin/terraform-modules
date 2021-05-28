provider "helm" {
  kubernetes {
    config_context = var.k8s_context
    config_path    = pathexpand(var.k8s_kubeconfig)
  }
}




# helm repo add codecentric https://codecentric.github.io/helm-charts
# helm show values codecentric/keycloak --version 10.3.0 > keycloak-values.yaml
resource "helm_release" "this" {
  count            = var.install ? 1 : 0
  name             = "keycloak"
  namespace        = "keycloak"
  create_namespace = true
  repository       = "https://codecentric.github.io/helm-charts"
  chart            = "keycloak"
  version          = "10.3.0"

  values = [file(pathexpand(var.values_file))]

}