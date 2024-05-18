1. Run the following pod.

```
kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: counter
spec:
  containers:
  - name: count
    image: busybox
    args: [/bin/sh, -c,'i=0; while true; do echo "Thanks for visiting devopscube! $i"; i=$((i+1)); sleep 1; done']
EOF
```

2. Open the Kibana UI.

```
kubectl port-forward svc/kibana-np 2001:8080
```

3. Go to Management (the gear icon on the left)

4. Click **Index Patterns** under Kibana

5. Click the blue **Create index pattern** button.

6. You'll see a message that says you need to index some data. Click the link that says `get started with some sample data sets`.

7. Choose the **Sample flight data** option

You can now see several pieces of data within the dashboards.
