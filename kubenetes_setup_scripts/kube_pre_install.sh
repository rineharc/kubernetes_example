ssh crine@207.180.200.55

#disable swap
sudo swapoff -a

#install common utils
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common


#install docker
sudo apt install docker.io

#start & automate docker
sudo systemctl start docker
sudo systemctl enable docker

#install kubernetes
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

#initialize the cluster
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

#copy kubectl configs
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#taint nodes so pods can run on master
kubectl taint nodes --all node-role.kubernetes.io/master-

#install pod network
kubectl apply -f https://docs.projectcalico.org/v3.11/manifests/calico.yaml
