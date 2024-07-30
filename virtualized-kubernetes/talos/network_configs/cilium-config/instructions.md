1. Generate the config for Talos with no CNI
```
talosctl gen config my-cluster https://192.168.1.44:6443 --config-patch @cil.yaml
```

2. Install Cilium
```
helm install \
    cilium \
    cilium/cilium \
    --version 1.15.6 \
    --namespace kube-system \
    --set ipam.mode=kubernetes \
    --set kubeProxyReplacement=true \
    --set securityContext.capabilities.ciliumAgent="{CHOWN,KILL,NET_ADMIN,NET_RAW,IPC_LOCK,SYS_ADMIN,SYS_RESOURCE,DAC_OVERRIDE,FOWNER,SETGID,SETUID}" \
    --set securityContext.capabilities.cleanCiliumState="{NET_ADMIN,SYS_ADMIN,SYS_RESOURCE}" \
    --set cgroup.autoMount.enabled=false \
    --set cgroup.hostRoot=/sys/fs/cgroup \
    --set k8sServiceHost=localhost \
    --set k8sServicePort=7445 \
    --kubeconfig kubeconfig
```

3. If you already deployed Talos without this config, that means Flannel exists (that's the default CNI). You'll have to delete it.
```
kubectl delete daemonset kube-flannel -n kube-system --kubeconfig kubeconfig
```