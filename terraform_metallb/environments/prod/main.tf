module "preMetalLB" {
    source = "../../modules/preMetalLB"

    namespace = "metallb-system"
}
module "postMetalLB" {
    source = "../../modules/postMetalLB"

    namespace = "metallb-system"
    ip_pool_name = "ip-pool1"
    ip_addresses = "172.31.0.1-172.31.0.90"
    ip_advertise_name = "advertise-l2-metallb-ip"
    
}