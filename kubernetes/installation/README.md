# Installation

### Cluster network ports

| Component	| Port	| Used by	|
|:---------:|:-----:|:---------:|
| API		| 6443	| all		|
| etcd		| 2379, 2380	| API/etcd	|
| Scheduler	| 10251	| self		|
| Controller Manager	| 10252	| self	|
| kubelet	| 10250	| all control plane components	|
| NodePort	| 30000 - 32767	| all	|

### Required packages

Install on all nodes:
+ containerd
+ kubelet
+ kubeadm
+ kubectl
