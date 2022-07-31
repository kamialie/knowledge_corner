#!/bin/bash

###############################################################################
# Networking
###############################################################################

# Get networking configuration
wget https://docs.projectcalico.org/manifests/calico.yaml

# Adjust cidr block (CALICO_IPV4POOL_CIDR setting) to ensure it doesn't overlap with other networks (this one will be used for pods)
vim calico.yaml

# cluster configuration
kubeadm config print init-defaults | tee ClusterConfiguration.yaml

# change 4 things
# 1. IP endpoint of API server (localAPIEndpoint.advertiseAddress setting) - update to cp node address
# 2. nodeRegistration.criSocket to containerd
# /run/containerd/containerd.sock
# 3. set cgroup driver to systemd (if not present)
# ---
# apiVersion: kubelet.config.k8s.io/v1beta1
# kind: KubeletConfiguration
# cgroupDriver: systemd
# 4. update kubernetesVerstion

# bootstrap cluster (control plane)
sudo kubeadm init \
	--config=ClusterConfiguration.yaml \
	--cri-socket /run/containerd/containerd.sock

# prepare client
mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# deploy networking
# update timeoutSeconds in livenessProbe and readinessProbe to 60
kubectl apply -f calico.yaml

# coredns will not be in ready state until calico is deployed
# after that all should be in running state
