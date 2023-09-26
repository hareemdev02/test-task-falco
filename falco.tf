resource "kubernetes_namespace" "falco" {
  metadata {
    name = "falco"
  }
}

resource "kubernetes_config_map" "falco_rules_configmap" {
  metadata {
    name      = "falco-rules-configmap"
    namespace = kubernetes_namespace.falco.metadata[0].name
  }

  data = {
    "falco_rules.yaml" = file("${path.module}/falco_rules.yaml")
  }
}

resource "helm_release" "falco" {
  name       = "falco"
  namespace  = kubernetes_namespace.falco.metadata[0].name
  repository = "falcosecurity"
  chart      = "falco"

  set {
    name  = "driver.kind"
    value = "ebpf"
  }

  set {
    name  = "tty"
    value = "true"
  }

  set {
    name  = "falcosidekick.enabled"
    value = "true"
  }

  set {
    name  = "falcosidekick.config.slack.webhookurl"
    value = "falcosidekick.config.slack.webhookurl="https://hooks.slack.com/services/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""
  }

  set {
    name  = "falcosidekick.config.slack.minimumpriority"
    value = "notice"
  }

  set {
    name  = "falcosidekick.config.customfields"
    value = "user:ashar"
  }
}