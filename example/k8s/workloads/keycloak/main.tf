module "keycloak" {
#   source         = "../../../../k8s/workloads/keycloak"
  source         = "github.com/funfin/terraform-modules/k8s/workloads/keycloak"
  install        = true
  k8s_context    = "do-fra1-playground"
  k8s_kubeconfig = pathexpand("~/.kube/config")
  values_file    = "${path.module}/keycloak-values.yaml"
}