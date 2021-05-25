module "k8s-cluster" {
  # source                 = "../../../../k8s/clusters/do"
  source                 = "github.com/funfin/terraform-modules/k8s/clusters/do"
  worker_node_count      = 1
  worker_node_min        = 1
  worker_node_max        = 2
  worker_node_auto_scale = false
  worker_node_type       = "s-1vcpu-2gb"
  cluster_name           = "test"
  k8s_version            = "1.20"
  region                 = "fra1"
  k8s_kubeconfig         = "${path.module}/kubeconfig"
}


