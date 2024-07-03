1. download the Talos ISO

```
curl https://github.com/siderolabs/talos/releases/download/v1.7.5/metal-amd64.iso -L -o talos.iso
```

2. Deploy the ISO as a VM

3. Pull down the Kubernetes config.

```
talosctl gen config talos-proxmox-cluster https://IP_OF_CONTROL_PLANE_VM:6443 --output-dir _out
```

4. Create the control plane from the output of the `gen config` command.
```
export CONTROL_PLANE_IP=
talosctl apply-config --insecure --nodes $CONTROL_PLANE_IP --file _out/controlplane.yaml
```

5. Create the worker node from the output of the `gen config` command.
```
export WORKER_NODE_IP=
talosctl apply-config --insecure --nodes $WORKER_NODE_IP --file _out/worker.yaml
```

6. Set the API Server via a Config for Kubeconfig
```
export TALOSCONFIG="_out/talosconfig"

talosctl config endpoint $CONTROL_PLANE_IP

talosctl config node $CONTROL_PLANE_IP

```

7. Bootstrap Etcd
```
talosctl bootstrap
```

8. Get the Kubeconfig
```
talosctl kubeconfig .
```

9. Test to confirm that the Kubeconfig is valid.
```
kubectl get nodes --kubeconfig=kubeconfig
```

10. You can see the Pod output to confirm that the cluster is running as expected.
```
kubectl get pods -n kube-system --kubeconfig=kubeconfig
```

Output should look similiar to the below:
```
coredns-64b67fc8fd-crkx6                1/1     Running   0              7m39s
coredns-64b67fc8fd-nfzh7                1/1     Running   0              7m39s
kube-apiserver-talos-up7-feu            1/1     Running   0              7m3s
kube-controller-manager-talos-up7-feu   1/1     Running   1 (8m3s ago)   6m47s
kube-flannel-g5kwz                      1/1     Running   0              7m38s
kube-flannel-jhtwm                      1/1     Running   0              7m37s
kube-proxy-brjg9                        1/1     Running   0              7m37s
kube-proxy-hrcb9                        1/1     Running   0              7m38s
kube-scheduler-talos-up7-feu            1/1     Running   1 (8m3s ago)   6m46s
```
