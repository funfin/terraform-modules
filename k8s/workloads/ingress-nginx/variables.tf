
variable "install" {
  type = bool
}

variable "k8s_context" {
  type = string
}

variable "k8s_kubeconfig" {
  type = string
}

variable "publish_service_enabled" {
  type    = bool
  default = true
}

variable "namespace" {
  type    = string
  default = "kube-system"
}
