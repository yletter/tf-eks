# Kubernetes Deployment Manifest
resource "kubernetes_deployment_v1" "release" {
  metadata {
    name = "release-blue"
    labels = {
      app = "release"
    }
  } 
 
  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "release"
      }
    }

    template {
      metadata {
        labels = {
          app = "release"
        }
      }

      spec {
        container {
          image = "stacksimplify/kubenginx:1.0.0"
          name  = "release-container"
          port {
            container_port = 80
          }
          }
        }
      }
    }
}

# Kubernetes Service Manifest (Type: Load Balancer)
# resource "kubernetes_service_v1" "lb_service" {
#   metadata {
#     name = "release-lb-service"
#   }
#   spec {
#     selector = {
#       app = kubernetes_deployment_v1.release.spec.0.selector.0.match_labels.app
#     }
#     port {
#       name        = "http"
#       port        = 80
#       target_port = 80
#     }
#     type = "LoadBalancer"
#   }
# }

# Kubernetes Service Manifest (Type: Node Port Service)
# resource "kubernetes_service_v1" "np_service" {
#   # count = 0
#   metadata {
#     name = "release-nodeport-service"
#   }
#   spec {
#     selector = {
#       app = kubernetes_deployment_v1.release.spec.0.selector.0.match_labels.app
#     }
#     port {
#       name        = "http"
#       port        = 80
#       target_port = 80
#       node_port   = 31280
#     }
#     type = "NodePort"
#   }
# }

# Kubernetes Service Manifest (Type: Load Balancer)
resource "kubernetes_service_v1" "lb_service_nlb" {
  metadata {
    name = "release-lb-service-nlb"
    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-type" = "nlb"    # To create Network Load Balancer  
    }   
  }
  spec {
    selector = {
      app = kubernetes_deployment_v1.release.spec.0.selector.0.match_labels.app
    }
    port {
      name        = "http"
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}
