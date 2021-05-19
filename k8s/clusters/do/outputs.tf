
output cluster_id {
  value = digitalocean_kubernetes_cluster.this.id
}


output k8s_context {
  value = "do-${var.region}-${var.cluster_name}"
}
