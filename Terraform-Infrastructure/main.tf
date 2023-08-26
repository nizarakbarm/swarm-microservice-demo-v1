

resource "aws_lightsail_instance" "lightsail_k8s" {
    count = 3

    name = "node-${count.index}"
    availability_zone = var.availability_zone_name
    blueprint_id = var.blueprint_id
    bundle_id = var.bundle_id
    key_pair_name = var.key_pair_name
    tags = {
        node = "k8s"
    }
    # provisioner "local-exec" {
    #     command = "aws lightsail put-instance-public-ports --instance-name=node-${count.index} --port-infos fromPort=6443,toPort=6443,protocol=tcp fromPort=9345,toPort=9345,protocol=tcp fromPort=10250,toPort=10250,protocol=tcp"
    # }
}

# #Define public port that needed by rke2
# resource "aws_lightsail_instance_public_ports" "public_ports_6443" {
#     count = 3

#     instance_name = "node-${count.index}"

#     port_info {
#       protocol = "tcp"
#       from_port = "6443"
#       to_port = "6443"
#     }

#     depends_on = [ aws_lightsail_instance.lightsail_k8s ]
# }

# resource "aws_lightsail_instance_public_ports" "public_ports_9345" {
#     count = 3

#     instance_name = "node-${count.index}"

#     port_info {
#       protocol = "tcp"
#       from_port = "9345"
#       to_port = "9345"
#     }

#     depends_on = [ aws_lightsail_instance.lightsail_k8s ]
# }

# resource "aws_lightsail_instance_public_ports" "public_ports_10250" {
#     count = 3

#     instance_name = "node-${count.index}"

#     port_info {
#       protocol = "tcp"
#       from_port = "10250"
#       to_port = "10250"
#     }

#     depends_on = [ aws_lightsail_instance.lightsail_k8s ]
# }