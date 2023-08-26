# Resource provisioning shell script for configure rke2
resource "terraform_data" "shellScriptProvisioner" {
    for_each = var.node-definition
    connection {
        type = "ssh"
        user = "ubuntu"
        host = each.value.ip
        private_key = sensitive(file(each.value.key))
    }
    provisioner "file" {
        source = each.value.rke2shell
        destination = "/home/ubuntu/rke2configshell.sh"
    }    
}

#get UUID
data "command" "getUUID" {
    command = ["cat", "/proc/sys/kernel/random/uuid"]

    depends_on = [ terraform_data.shellScriptProvisioner ]
}

# output "getUUID_output" {
#     value = trim(data.command.getUUID.stdout,"'\"")
# }

#change UUID
resource "terraform_data" "changeUUID" {
    for_each = var.node-definition
    connection {
        type = "ssh"
        user = "ubuntu"
        host = each.value.ip
        private_key = sensitive(file(each.value.key))
    }
    provisioner "remote-exec" {
        inline = [
            "sed 's/UUID_VAL/${trim(data.command.getUUID.stdout,"'\"\n")}/g' /home/ubuntu/rke2configshell.sh"
        ]        
    }

    depends_on = [ data.command.getUUID ]
}

#change permission script
resource "terraform_data" "change_permission" {
    for_each = var.node-definition
    connection {
        type = "ssh"
        user = "ubuntu"
        host = each.value.ip
        private_key = sensitive(file(each.value.key))
    }
    provisioner "remote-exec" {
        inline = [
            "chmod 755 /home/ubuntu/rke2configshell.sh"
        ]        
    }

    depends_on = [ data.command.getUUID, terraform_data.changeUUID ]
}

#Execute shell script to configure rke2 server at node-0
resource "terraform_data" "configureRKE2_node_0" {
    connection {
        type = "ssh"
        user = "ubuntu"
        host = var.node-0
        private_key = sensitive(file("/home/devnull/.ssh/amazon"))
    }

    provisioner "remote-exec" {
        inline = [
            "sudo bash /home/ubuntu/rke2configshell.sh"
        ]        
    }

    depends_on = [ terraform_data.changeUUID, terraform_data.change_permission ]
}

#Execute shell script to configure rke2 server for node-1 and node-2
resource "terraform_data" "configureRKE2_node_1_2" {
    for_each = var.node-definition-1-2
    connection {
        type = "ssh"
        user = "ubuntu"
        host = each.value.ip
        private_key = sensitive(file(each.value.key))
    }

    provisioner "remote-exec" {
        inline = [
            "sudo bash /home/ubuntu/rke2configshell.sh"
        ]        
    }

    depends_on = [ terraform_data.configureRKE2_node_0 ]
}