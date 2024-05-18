## Implement Metrics Server and kube-state-metrics


### Metrics Server
For some clusters, the Metrics Server may already exist. For example, it comes out of the box in AKS. However, in some cases, it may not. You can use Helm to install it.

```
helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
```

```
helm upgrade --install metrics-server metrics-server/metrics-server
```


### kube-state-metrics

You typically won't see `kube-state-metrics` out of the box. You can install it with Helm.

```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

```
helm install kubestatemetrics prometheus-community/kube-state-metrics
```