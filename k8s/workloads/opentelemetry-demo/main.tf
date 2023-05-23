
# https://opentelemetry.io/docs/demo/kubernetes-deployment/
resource "helm_release" "otel-demo" {
  count            = var.install ? 1 : 0
  name             = "${var.name}"
  namespace        = var.namespace
  create_namespace = var.create_namespace
  repository       = "https://open-telemetry.github.io/opentelemetry-helm-charts"
  chart            = "opentelemetry-demo"
  version          = "0.22.3"
}
