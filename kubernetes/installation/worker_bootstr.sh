#!/bin/bash

# install packages
# kubeadm join
kubeadm join IP:6443 \
	--token <token> \
	--discovery-token-ca-cert-hash <sha> \
# if missing
# kubeadm token list (kubeadm token create)
# openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'
# or generate again with print command
# kubeadm token create --print-join-command

# download cluster info
# node submits a CSR
# CA signs the CSR automatically
# kubelet.conf is generated (with info about client certificate location)
