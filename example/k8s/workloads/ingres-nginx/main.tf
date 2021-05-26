module "ingress-nginx" {
    # source                 = "../../../../k8s/workloads/ingress-nginx"
    source                 = "github.com/funfin/terraform-modules/k8s/workloads/ingres-nginx"
    install = true
    k8s_context = "do-fra1-playground"
    k8s_kubeconfig = pathexpand("~/.kube/config")
}