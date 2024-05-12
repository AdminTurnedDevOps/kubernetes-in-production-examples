```
helm repo add chaos-mesh https://charts.chaos-mesh.org
```

As you’re installing Chaos Mesh, you have the choice to choose between different environments based on the underlying platform and container runtime.


Go to this [link](https://chaos-mesh.org/docs/production-installation-using-helm/) and choose the runtime that works best for you.

For example, if your cluster is running CRI-O, the following installation will be for you.

```
helm install chaos-mesh chaos-mesh/chaos-mesh \
-n=chaos-mesh --set chaosDaemon.runtime=crio \
--set chaosDaemon.socketPath=/var/run/crio/crio.sock \
--create-namespace

```

Verify the installation.

```
kubectl get all -n chaos-mesh
```