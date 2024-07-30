ip_address=192.168.1.100
cidr=172.18.0.0/16
publicIP=192.168.1.100

sudo kubeadm init --control-plane-endpoint $publicIP --apiserver-advertise-address $ip_address --pod-network-cidr=$cidr --upload-certs