## Portainer

1. Add the Portainer Helm Chart
```
helm repo add portainer https://portainer.github.io/k8s/
```

2. Update repos
```
helm repo update
```

3. Install the Helm Chart
```
helm upgrade --install --create-namespace -n portainer portainer portainer/portainer \
    --set service.type=LoadBalancer \
    --set tls.force=true
```

## Viewing Resources

### Portainer

1. Log into Portainer
2. Go to your Kubernetes cluster
3. Click on Cluster

You should now be able to see the cluster resources available.