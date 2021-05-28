
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
  default = "keycloak"
}


variable "values_file" {
  type = string
}
