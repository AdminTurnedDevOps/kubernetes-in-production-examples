1. Deploy the `storage.yaml`
2. Deploy the `statefulset.yaml`
3. See the deployment running
```
kubectl get pods

kubectl describe statefulset mysql
```

4. Confirm the volumes are bound
```
kubectl get pvc

kubectl get pv
```

4. Connect to the Pod
```
kubectl exec -tid POD_NAME
```