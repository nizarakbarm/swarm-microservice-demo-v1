resource "helm_release" "ingress" {
    repository = "https://kubernetes.github.io/ingress-nginx"
    chart = "ingress-nginx"
    name = "ingress-nginx"

    values = [
      "${file("../../helm-manifest/values.yaml")}"
    ]
}