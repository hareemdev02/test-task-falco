resource "kubernetes_deployment" "suricata_deployment" {
  metadata {
    name = "suricata"
  }

  spec {
    selector {
      match_labels = {
        app = "suricata"
      }
    }

    template {
      metadata {
        labels = {
          app = "suricata"
        }
      }

      spec {
        container {
          name  = "suricata"
          image = "dtagdevsec/suricata" 

        }
      }
    }
  }
}

resource "kubernetes_service" "suricata_service" {
  metadata {
    name = "suricata-service"
  }

  spec {
    selector = {
      app = "suricata"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}
