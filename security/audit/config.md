## Enable audit logs on control plane

1. Copy everything in `policy.yaml` in the existing Demo directory.

2. SSH into the Kubernetes cluster and go to:

```
sudo vim /etc/kubernetes/simple-policy.yaml
```

3. Open up the following location:

```
sudo vim /etc/kubernetes/manifests/kube-apiserver.yaml
```

Add in the following:

```
- --audit-log-maxage=7
- --audit-log-maxbackup=2
- --audit-log-maxsize=50
```

```
- --audit-log-path=/var/log/audit.log
- --audit-policy-file=/etc/kubernetes/simple-policy.yaml
```

Under volume mounts, add the following

```
- mountPath: /etc/kubernetes/simple-policy.yaml
  name: audit
  readOnly: true
- mountPath: /var/log/audit.log
  name: audit-log
  readOnly: false
```

Under host path, add the following:

```
- hostPath:
    path: /etc/kubernetes/simple-policy.yaml
    type: File
  name: audit
- hostPath:
    path: /var/log/audit.log
    type: FileOrCreate
  name: audit-log
```

4. Restart kubelet

```
sudo systemctl restart kubelet
```

4. Confirm that the Kubelet is still running

```
kubectl get nodes
```