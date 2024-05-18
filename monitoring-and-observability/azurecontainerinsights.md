## Setting Up Container Insights In Azure

If you need code to set up an AKS cluster, check this out: https://github.com/AdminTurnedDevOps/Kubernetes-Quickstart-Environments/tree/main/azure/aks

To enable container insights:
1. Enable the Addon
```
az aks enable-addons -a monitoring -n <cluster-name> -g <cluster-resource-group-name>
```

You should now be able to see the container insights info in Azure Monitor