worker_node_count      = 1
worker_node_min        = 1
worker_node_max        = 3
worker_node_auto_scale = "true"
worker_node_type       = "s-1vcpu-2gb"
cluster_name           = "tf-do-k8s-cluster"
k8s_version            = "1.20"
region                 = "fra1"
k8s_kubeconfig         = "~/.kube/config"

