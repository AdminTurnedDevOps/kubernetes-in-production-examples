1. Deploy the statefulset.yaml
2. See the two Pods come up
3. Run the following to see the Pod names
```
kubectl get pods
```
4. Take note of the Pod namespaces
5. Delete one of the Pods
6. Run the following to see the Pods again
```
kubectl get pods
```

Not only will you see the new Pod come to life due to the Controllers self-healing capabilities, but you'll see that the Pod has the same exact name. The unique identifier stays the same, which is what makes StatefulSets important if you need the ID to stay the same for an application workload.