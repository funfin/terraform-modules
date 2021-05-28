
variable "install" {
  type = bool
}

variable "k8s_context" {
  type = string
}

variable "k8s_kubeconfig" {
  type = string
}

variable "namespace" {
  type    = string
  default = "external-dns"
}

variable "digitalocean_api_token" {
  type = string
}

variable "dns_domain" {
  type = string
}

variable "policy" {
  type    = string
  default = "sync"
  # default = "upsert-only"
}

