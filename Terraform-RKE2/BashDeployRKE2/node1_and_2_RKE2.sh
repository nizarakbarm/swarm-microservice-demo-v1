#!/bin/bash
sudo mkdir -p /etc/rancher/rke2/
#Get UUID with sudo cat /proc/sys/kernel/random/uuid
#Don't forget to change IPNODE0 with IP of Node 0
sudo cat <<EOF > /etc/rancher/rke2/config.yaml
server: https://node0:9345
token: UUID_VAL
tls-san:
  - node0
EOF

#activate rke2-server service
sudo curl -sfL https://get.rke2.io | sh -
sudo echo "IPNODE0 node0" >> /etc/hosts
systemctl enable rke2-server.service --now
if [[ $(sudo systemctl is-active rke2-server.service) == "active" ]]; then mkdir -p /home/ubuntu/.kube; sudo cp /etc/rancher/rke2/rke2.yaml /home/ubuntu/.kube/config; chown -R ubuntu:ubuntu /home/ubuntu/.kube; fi

#download kubectl
sudo curl -LO --output-dir /usr/local/bin https://dl.k8s.io/release/v1.26.8/bin/linux/amd64/kubectl
sudo chmod 755 /usr/local/bin/kubectl

#download helm
sudo curl -fsSL -o /root/get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
sudo chmod 700 /root/get_helm.sh
sudo /root/get_helm.sh