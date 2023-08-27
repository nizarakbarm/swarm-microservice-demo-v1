// Resource used for creating metallb system namespace at kubernetes
resource "kubernetes_namespace" "metallb_namespace" {
    metadata {
        labels = {
          "pod-security.kubernetes.io/audit" = "privileged"
          "pod-security.kubernetes.io/enforce" = "privileged"
          "pod-security.kubernetes.io/warn" = "privileged"
        }
        name = var.namespace
    }
    
}

//Resource for set ipvs mode at kubeproxy
resource "helm_release" "metallb" {
    name = "metallb"
    repository = "https://metallb.github.io/metallb"
    chart = "metallb"

    namespace = var.namespace

    depends_on = [ kubernetes_namespace.metallb_namespace ]
}
