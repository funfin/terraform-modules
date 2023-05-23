locals {
  k8s_context    = "do-fra1-playground"
  k8s_kubeconfig = pathexpand("~/.kube/config")
}

provider "helm" {
  kubernetes {
    config_context = local.k8s_context
    config_path    = local.k8s_kubeconfig
  }
}

module "opentelemetry-demo" {
    # source                 = "../../../../k8s/workloads/opentelemetry-demo"
    source                 = "github.com/funfin/terraform-modules/k8s/workloads/opentelemetry-demo"
    install = true
}