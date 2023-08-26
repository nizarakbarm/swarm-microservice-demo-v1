variable "blueprint_id" {
    description = "Variable for lightsail blueprint id"
    type = string
    default = "ubuntu_22_04"
}

variable "availability_zone_name" {
    description = "availability zone for lightsail"
    type = string
    default = "ap-southeast-1a"
}

variable "key_pair_name" {
    description = "key pair that will be used at lightsail"
    type = string
    default = "amazon"
}

variable "bundle_id" {
    description = "bundle id for lightsail"
    type = string
    default = "large_3_0"
}

# variable "node-definition" {
#     description = "Definition of each node of lightsail"
#     type = map(any)
#     default = {
#         "0" = {name = "node0", blueprintid="ubuntu_22_04", bundle_id="large_win_3_0", availability_zone_name="ap-southeast-1a", key_pair_name="amazon" },
#         "1" = {name = "node1", blueprintid="ubuntu_22_04", bundle_id="large_win_3_0", availability_zone_name="ap-southeast-1a", key_pair_name="amazon" },
#         "2" = {name = "node2", blueprintid="ubuntu_22_04", bundle_id="large_win_3_0", availability_zone_name="ap-southeast-1a", key_pair_name="amazon" },
#     }
# }