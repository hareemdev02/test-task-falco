resource "kubernetes_deployment" "falco_deployment" {
  metadata {
    name = "falco"
  }

  spec {
    selector {
      match_labels = {
        app = "falco"
      }
    }

    template {
      metadata {
        labels = {
          app = "falco"
        }
      }

      spec {
        container {
          name  = "falco"
          image = "falcosecurity/falco"
        }
      }
    }
  }
}

resource "kubernetes_service" "falco_service" {
  metadata {
    name = "falco-service"
  }

  spec {
    selector = {
      app = "falco"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}
