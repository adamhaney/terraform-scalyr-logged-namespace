variable "scalyr_api_key" {
  description = "API key to use when connecting to scaylr"
}

variable "namespace" {
  description = "The namespace to launch the daemonset (only pods in this namespace will be monitored)"
}
