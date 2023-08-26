variable "node-0" {
    description = "node-0 ip"
    type = string
    default = "52.77.228.35"
}

variable "node-definition" {
    description = "Definition of each node of lightsail"
    type = map(any)
    default = {
        "0" = {name = "node-0", ip="52.77.228.35", rke2shell="BashDeployRKE2/node0_RKE2.sh", key="/home/devnull/.ssh/amazon" },
        "1" = {name = "node-1", ip="54.255.240.90", rke2shell="BashDeployRKE2/node1_and_2_RKE2.sh", key="/home/devnull/.ssh/amazon"},
        "2" = {name = "node-2", ip="13.212.194.75", rke2shell="BashDeployRKE2/node1_and_2_RKE2.sh", key="/home/devnull/.ssh/amazon"},
    }
}

variable "node-definition-1-2" {
    description = "Definition of node 1-2 of lightsail"
    type = map(any)
    default = {
        "1" = {name = "node-1", ip="54.255.240.90", rke2shell="BashDeployRKE2/node1_and_2_RKE2.sh", key="/home/devnull/.ssh/amazon"},
        "2" = {name = "node-2", ip="13.212.194.75", rke2shell="BashDeployRKE2/node1_and_2_RKE2.sh", key="/home/devnull/.ssh/amazon"},
    }
}