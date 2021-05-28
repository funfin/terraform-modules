module "cert-manager" {
#   source         = "../../../../k8s/workloads/cert-manager"
  source         = "github.com/funfin/terraform-modules/k8s/workloads/cert-manager"
  install        = true
  k8s_context    = "do-fra1-playground"
  k8s_kubeconfig = pathexpand("~/.kube/config")
  email          = "admin@example.com"
}