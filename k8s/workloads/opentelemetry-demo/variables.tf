
variable "install" {
  type = bool
}

variable "name" {
  type = string
  default = "my-otel-demo"
}

variable "namespace" {
  type    = string
  default = "otel-demo"
}


variable "create_namespace" {
  type = bool
  default = true
}