variable "node-0" {
    description = "node-0 ip"
    type = string
    default = "[NODE0-IP]"
}

variable "node-definition" {
    description = "Definition of each node of lightsail"
    type = map(any)
    default = {
        "0" = {name = "node-0", ip="[NODE0-IP]", rke2shell="BashDeployRKE2/node0_RKE2.sh", key="[PATH_SSH_PRIVATE_KEY]" },
        "1" = {name = "node-1", ip="[NODE1-IP]", rke2shell="BashDeployRKE2/node1_and_2_RKE2.sh", key="[PATH_SSH_PRIVATE_KEY]"},
        "2" = {name = "node-2", ip="[NODE2-IP]", rke2shell="BashDeployRKE2/node1_and_2_RKE2.sh", key="[PATH_SSH_PRIVATE_KEY]"},
    }
}

variable "node-definition-1-2" {
    description = "Definition of node 1-2 of lightsail"
    type = map(any)
    default = {
        "1" = {name = "node-1", ip="[NODE0-IP]", rke2shell="BashDeployRKE2/node1_and_2_RKE2.sh", key="[PATH_SSH_PRIVATE_KEY]"},
        "2" = {name = "node-2", ip="[NODE1-IP]", rke2shell="BashDeployRKE2/node1_and_2_RKE2.sh", key="[PATH_SSH_PRIVATE_KEY]"},
    }
}