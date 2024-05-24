As of May 2024, Azure now has an add-on to implement KEDA.

You can do it in the portal by going to Settings > Application scaling.

OR

### Create A New Cluster With The Addon

```
az aks create --resource-group devrelasaservice \
--name aksenvironment01 \
--enable-keda
```


### Edit An Existing Cluster With The Addon

```
az aks update --resource-group devrelasaservice \
--name aksenvironment01 \
--enable-keda
```