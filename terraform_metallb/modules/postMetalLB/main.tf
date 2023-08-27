//IP Pool which will be used by metallb
resource "kubernetes_manifest" "ippool1" {
    manifest = {
        apiVersion = "metallb.io/v1beta1"
        kind = "IPAddressPool"

        metadata = {
            name = var.ip_pool_name
            namespace = var.namespace
        }
        spec = {
            addresses = [ var.ip_addresses ]
        }
    }
}

// l2advertisement resource for metallb
resource "kubernetes_manifest" "l2advertisement" {
    manifest = {
        apiVersion = "metallb.io/v1beta1"
        kind = "L2Advertisement"

        metadata = {
            name = var.ip_advertise_name
            namespace = var.namespace
        }

        spec = {
            ipAddressPools = [ var.ip_pool_name ]
        }
    }
}