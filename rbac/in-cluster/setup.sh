# Service Account
kubectl create sa podcreator

# Get Service Account
kubectl get sa podcreator

```
kubectl apply -f - <<EOF
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: podcreator
rules:
- apiGroups: [""]
  resources: ["pods", "deployments"]
  verbs: ["get", "update", "list", "create"]
EOF
```

```
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: write-pod-default
  namespace: default
subjects:
- kind: ServiceAccount
  name: podcreator
  apiGroup: ""
  namespace: default
roleRef:
  kind: Role
  name: writer
  apiGroup: rbac.authorization.k8s.io
EOF
```

Create a Pod with the service account
```
kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: nginxpod
spec:
  containers:
  - image: nginx:latest
    name: nginxpod
  serviceAccountName: podcreator
  automountServiceAccountToken: false
EOF
```