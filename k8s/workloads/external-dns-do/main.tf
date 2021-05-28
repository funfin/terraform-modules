provider "helm" {
  kubernetes {
    config_context = var.k8s_context
    config_path    = pathexpand(var.k8s_kubeconfig)
  }
}

resource "helm_release" "external-dns-do" {
  count            = var.install ? 1 : 0
  name             = "external-dns-do"
  namespace        = "external-dns"
  create_namespace = true
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "external-dns"
  version          = "3.3.0"

  set {
    type  = "string"
    name  = "provider"
    value = "digitalocean"
  }
  set {
    type  = "string"
    name  = "digitalocean.apiToken"
    value = var.digitalocean_api_token
  }
  set {
    type  = "string"
    name  = "interval"
    value = "1m"
  }

  set {
    type  = "string"
    name  = "policy"
    value = var.policy
  }

  set {
    type  = "string"
    name  = "domainFilters[0]"
    value = var.dns_domain
  }

  set {
    type  = "string"
    name  = "rbac.create"
    value = "true"
  }


}