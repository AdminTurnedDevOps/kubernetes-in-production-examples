```
helm repo add litmuschaos https://litmuschaos.github.io/litmus-helm/

```

```
helm install chaos litmuschaos/litmus \
--namespace=litmus \
--set portal.frontend.service.type=NodePort \
--create-namespace

```


```
kubectl get all -n litmus
```

To access the LitmusChaos dashboard, you can use the `litmusportal-frontend-service`.

```
kubectl get svc -n litmus
```

```
kubectl port-forward svc/chaos-litmus-frontend-service -n litmus 8080:9091
```

The default credentials are:

- Username: admin
- Password: litmus