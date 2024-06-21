## ArgoCD
1. First, add the Helm repo for ArgoCD.

```
helm repo add argo https://argoproj.github.io/argo-helm
```

2. Next, deploy ArgoCD with Helm.

**if you aren't running a cluster with 3 or more Worker Nodes, run the following Helm Chart**

```
helm install argocd -n argocd argo/argo-cd --create-namespace
```

You'll need to run a `port-forward` command on the ArgoCD service if you aren't running in HA.

**if you are running a cluster with 3 or more Worker Nodes, run the following Helm Chart**

```
helm install argocd -n argocd argo/argo-cd \
--set redis-ha.enabled=true \
--set controller.replicas=1 \
--set server.autoscaling.enabled=true \
--set server.autoscaling.minReplicas=2 \
--set repoServer.autoscaling.enabled=true \
--set repoServer.autoscaling.minReplicas=2 \
--set applicationSet.replicaCount=2 \
--set server.service.type=LoadBalancer \
--create-namespace
```

Get the initial ArgoCD UI admin password
```
kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```


## Log Into Argo
1. Log into the server via the CLI.
`argocd login localipORloadbalancer:argocd_port_here`

## Update Password
1. In the Argo CD UI, go to User Info --> Update Password

2. Change the password from the initial admin password to a password of your choosing