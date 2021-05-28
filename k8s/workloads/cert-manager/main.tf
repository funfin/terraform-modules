provider "helm" {
  kubernetes {
    config_context = var.k8s_context
    config_path    = pathexpand(var.k8s_kubeconfig)
  }
}

provider "kubernetes" {
  config_path      = var.k8s_kubeconfig
  config_context   = var.k8s_context
}


resource "kubernetes_namespace" "cert-manager" {
  count      = var.install ? 1 : 0

  metadata {
    name = "cert-manager"
  }
}


resource "null_resource" "cert-manager-crd" {
  count      = var.install ? 1 : 0

  triggers = {
    manifest_sha1 = "${sha1("${file("${path.module}/cert-manager.crds.yaml")}")}"
    k8s_context = var.k8s_context
  }

  provisioner "local-exec" {
    command = "kubectl --context ${var.k8s_context} apply -f ${path.module}/cert-manager.crds.yaml"
  }

  provisioner "local-exec" {
    when = destroy
    command = "kubectl --context ${self.triggers.k8s_context} delete -f ${path.module}/cert-manager.crds.yaml"
  }

  depends_on = [kubernetes_namespace.cert-manager]
}


resource "helm_release" "cert-manager" {
  count      = var.install ? 1 : 0
  name       = "cert-manager"
  namespace  = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "v0.14.1"  # same version as crd

  depends_on = [
    kubernetes_namespace.cert-manager,
    null_resource.cert-manager-crd
  ]
}


data "template_file" "clusterissuers" {
    template = "${file("${path.module}/clusterissuers.yaml")}"

    vars = {
        email = var.email
    }
}


resource "null_resource" "cert-manager-clusterissuer" {
  count      = var.install ? 1 : 0

  triggers = {
    manifest_sha1 = "${sha1("${data.template_file.clusterissuers.rendered}")}"
    k8s_context = var.k8s_context
  }

  provisioner "local-exec" {
    command = "kubectl --context ${var.k8s_context} apply -f ${path.module}/clusterissuers.yaml"
  }

  provisioner "local-exec" {
    when = destroy
    command = "kubectl --context ${self.triggers.k8s_context} delete -f ${path.module}/clusterissuers.yaml"
  }

  depends_on = [
    kubernetes_namespace.cert-manager,
    null_resource.cert-manager-crd,
    helm_release.cert-manager
  ]
}