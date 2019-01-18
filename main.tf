resource "kubernetes_secret" "scalyr_api_key" {
  metadata {
    name      = "scalyr-api-key"
    namespace = "${var.namespace}"
  }

  data {
    "scalyr-api-key" = "${var.scalyr_api_key}"
  }
}

# Docs: https://www.scalyr.com/help/install-agent-kubernetes
# Using this hacky way to add a daemonset until https://github.com/terraform-providers/terraform-provider-kubernetes/pull/229 is merged
resource "helm_release" "scalyr_daemonset" {
  name      = "scalyr-agent"
  chart     = "${path.module}/chart"
  namespace = "${var.namespace}"

  set = [
    {
      name  = "namespace"
      value = "${var.namespace}"
    },
  ]
}
