data "digitalocean_kubernetes_versions" "this" {
  version_prefix = "${var.k8s_version}."
}

resource "digitalocean_kubernetes_cluster" "this" {
  name    = var.cluster_name
  region  = var.region
  version = data.digitalocean_kubernetes_versions.this.latest_version

  node_pool {
    name       = var.worker_node_auto_scale ? "autoscale-${var.cluster_name}-pool" : "${var.cluster_name}-pool"
    size       = var.worker_node_type
    node_count = var.worker_node_count
    auto_scale = var.worker_node_auto_scale
    min_nodes  = var.worker_node_min
    max_nodes  = var.worker_node_max
  }
}


resource "null_resource" "configure_kubeconfig" {
  provisioner "local-exec" {
    command = "doctl kubernetes cluster kubeconfig save ${digitalocean_kubernetes_cluster.this.id}"
    environment = {
      KUBECONFIG = var.k8s_kubeconfig
    }
  }
}
