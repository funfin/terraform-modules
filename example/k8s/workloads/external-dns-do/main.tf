variable "digitalocean_api_token" {
}

module "external-dns-do" {
    # source                 = "../../../../k8s/workloads/external-dns-do"
    source                 = "github.com/funfin/terraform-modules/k8s/workloads/external-dns-do"
    install = true
    k8s_context = "do-fra1-playground"
    k8s_kubeconfig = pathexpand("~/.kube/config")
    policy = "sync"
    dns_domain = "example.com"
    digitalocean_api_token = var.digitalocean_api_token
}