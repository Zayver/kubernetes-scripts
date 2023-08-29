#!/bin/bash

#Update system first time
sudo apt-get update

# Install packages
sudo apt-get install -y apt-transport-https ca-certificates curl neovim containerd net-tools

#Sign key
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

#Kubernetes apt repo
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Install kubernetes
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl

# wsl conf
echo "[boot]\nsystemd=true\ncommand=\"swapoff -a; sysctl -w net.ipv4.ip_forward=1\n\n[network]\ngenerateResolvConf=false\"" | sudo tee /etc/wsl.conf

#enable containerd
sudo systemctl enable containerd

echo "Reboot"
echo "Run firewall_config.ps1 to open win ports"
