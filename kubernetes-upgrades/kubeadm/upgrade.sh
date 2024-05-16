# Upgrades

This example shows going from v1.28 to v1.29

## Control Plane

1. Bring down the v1.29 packages
```
sudo apt-mark unhold kubeadm && \
sudo apt-get update && sudo apt-get install -y kubeadm='1.29.x-*' && \
sudo apt-mark hold kubeadm
```

2. Verify the plan
```
sudo kubeadm upgrade plan
```

3. Choose which version to upgrade to
```
sudo kubeadm upgrade apply v1.29.x
```

### If You Have More Than One Control Plane

1. Upgrade the Node
```
sudo kubeadm upgrade node
```

2. Drain the Node so it no longer holds the CP role.
```
kubectl drain NODE_NAME --ignore-daemonsets
```

3. Upgrade kubectl and the kubelet
```
sudo apt-mark unhold kubelet kubectl && \
sudo apt-get update && sudo apt-get install -y kubelet='1.29.x-*' kubectl='1.29.x-*' && \
sudo apt-mark hold kubelet kubectl
```

4. Reload the Daemon and restart the Kubelet
```
sudo systemctl daemon-reload
sudo systemctl restart kubelet
```

5. Add the CP back in as a CP
```
kubectl uncordon NODE_NAME
```


## Worker Node

1. Download Kubeadm
```
sudo apt-mark unhold kubeadm && \
sudo apt-get update && sudo apt-get install -y kubeadm='1.29.x-*' && \
sudo apt-mark hold kubeadm
```

2. Upgrade to the latest version
```
sudo kubeadm upgrade node
```

3. Remove the node as a WN
```
kubectl drain NODE_NAME --ignore-daemonsets
```

4. Install the new version of the Kubelet an Kubectl
```
sudo apt-mark unhold kubelet kubectl && \
sudo apt-get update && sudo apt-get install -y kubelet='1.29.x-*' kubectl='1.29.x-*' && \
sudo apt-mark hold kubelet kubectl
```

5. Reload the Daemon and restart the Kubelet
```
sudo systemctl daemon-reload
sudo systemctl restart kubelet
```

6. Bring the node back online as a WN
```
kubectl uncordon NODE_NAME
```