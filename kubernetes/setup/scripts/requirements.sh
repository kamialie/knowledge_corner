#!/bin/bash

# 2vCPU, 2GB RAM - minimum hardware

###############################################################################
# Containerd prerequisites
###############################################################################

# Disable swap
# Comment line with swap in /etc/fstab, then reboot vm, check by running 
swapoff -a

# Load modules and configure to load on boot
# https://kubernetes.io/docs/setup/production-environment/container-runtimes/
sudo modprobe overlay
sudo modprobe br_netfilter

cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

# Setup required sysctl params (these persist across reboots)
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

# Apply sysctl params without reboot
sudo sysctl --system

################################################################################
# Containerd installation
################################################################################

sudo apt update
sudo apt install -y containerd

# Create default configuration with minor change
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml

# Set cgroup driver for containerd to systemd which is required for kubelet
# In /etc/containerd/config.toml set (restart containerd afterwards) in the 
# following section:
# [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
# add these 2 lines (last update - these lines are already present, just set to
# true):
# [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
#   SystemdCgroup = true

# Apply changes 
sudo systemctl restart containerd

################################################################################
# Install Kubernetes packages
################################################################################

# Add Google's apt repo gpg key
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Add Kubernetes apt repo
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

# Update package list
sudo apt update

# Check available versions
apt-cache policy kubelet | head -n 20

# Install required version
VERSION=1.20.1-00
sudo apt install -y kubelet=$VERSION kubeadm=$VERSION kubectl=$VERSION

# prevent apt from maintaining and upgrading this packages automatically
# to control moving between versions of Kubernetes
# (independent of security patches being applied)
# due to predefined process for upgrading versions
sudo apt-mark hold containerd kubelet kubeadm kubectl

################################################################################
# Systemd units
################################################################################

# Check containerd and kubelet status
# kubelet will enter a crashloop until a cluster is created or a node joins an
# existing cluster
sudo systemctl status kubelet.service
sudo systemctl status containerd.service

# Ensure both are loaded on system boot
sudo systemctl enable kubelet.service
sudo systemctl enable containerd.service
