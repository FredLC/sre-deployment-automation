resource "kubernetes_namespace_v1" "udacity" {
  metadata {
    name = local.name
  }
  depends_on = [
    module.project_eks
  ]
}

resource "kubernetes_service_v1" "blue" {
  metadata {
    name      = "blue-svc"
    namespace = local.name
    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-type"            = "nlb"
      "service.beta.kubernetes.io/aws-load-balancer-nlb-target-type" = "ip"
    }
  }
  spec {
    selector = {
      app = "blue"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }

  depends_on = [
    module.project_eks
  ]
}

resource "kubernetes_service_v1" "green" {
  metadata {
    name      = "green-svc"
    namespace = local.name
    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-type"            = "nlb"
      "service.beta.kubernetes.io/aws-load-balancer-nlb-target-type" = "ip"
    }
  }
  spec {
    selector = {
      app = "green"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }

  depends_on = [
    module.project_eks
  ]
}