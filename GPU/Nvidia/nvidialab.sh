## https://explore.qwiklabs.com/classrooms/16352/labs/96408

kubectl apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/container-engine-accelerators/master/nvidia-driver-installer/cos/daemonset-preloaded-latest.yaml

```
kubectl create ns gpu-operator
```

```
kubectl apply -f - << EOF
apiVersion: v1
kind: ResourceQuota
metadata:
  name: gpu-operator-quota
  namespace: gpu-operator
spec:
  hard:
    pods: 100
  scopeSelector:
    matchExpressions:
    - operator: In
      scopeName: PriorityClass
      values:
        - system-node-critical
        - system-cluster-critical
EOF
```

```
helm install --wait gpu-operator \
  -n gpu-operator \
  nvidia/gpu-operator \
  --set hostPaths.driverInstallDir=/home/kubernetes/bin/nvidia \
  --set toolkit.installDir=/home/kubernetes/bin/nvidia \
  --set cdi.enabled=true \
  --set cdi.default=true \
  --set driver.enabled=false
```

```
kubectl get clusterpolicies.nvidia.com/cluster-policy
```

```
kubectl get pods -n gpu-operator
```

```
kubectl apply -f - << EOF
apiVersion: v1
kind: Pod
metadata:
  name: cuda-vectoradd
spec:
  restartPolicy: OnFailure
  containers:
  - name: vectoradd
    image: nvcr.io/nvidia/k8s/cuda-sample:vectoradd-cuda12.5.0
    resources:
      limits:
        nvidia.com/gpu: 1
EOF
```

```
kubectl apply -f - << EOF
apiVersion: v1
kind: Pod
metadata:
  name: dcgm-prof-tester
spec:
  restartPolicy: OnFailure
  containers:
    - name: dcgmproftester12
      image: nvcr.io/nvidia/cloud-native/dcgm:3.3.8-1-ubuntu22.04
      command: ["/usr/bin/dcgmproftester12"]
      args: ["--no-dcgm-validation", "-t 1004", "-d 30"]
      resources:
        limits:
          nvidia.com/gpu: 1
      securityContext:
        capabilities:
          add: ["SYS_ADMIN"]
EOF

```

## GPU Slicing

```
kubectl apply -f - << EOF 
apiVersion: v1
kind: ConfigMap
metadata:
  name: plugin-config
  namespace: gpu-operator
data:
  time-slicing: |-
    version: v1
    flags:
      migStrategy: none
    sharing:
      timeSlicing:
        renameByDefault: false
        resources:
          - name: nvidia.com/gpu
            replicas: 4
  mps: |-
    version: v1
    flags:
      migStrategy: none
    sharing:
      mps:
        renameByDefault: false
        resources:
          - name: nvidia.com/gpu
            replicas: 4
EOF
```

```
cat > patch.yaml << EOF
spec:
  devicePlugin:
    config:
      name: plugin-config
      default: time-slicing
EOF

kubectl patch clusterpolicies.nvidia.com/cluster-policy --type=merge --patch-file=patch.yaml
```

```
kubectl apply -f - << EOF
apiVersion: batch/v1
kind: Job
metadata:
  name: dcgm-prof-tester
spec:
  parallelism: 4
  template:
    metadata:
      labels:
        app: dcgm-prof-tester
    spec:
      restartPolicy: OnFailure
      containers:
        - name: dcgmproftester12
          image: nvcr.io/nvidia/cloud-native/dcgm:3.3.8-1-ubuntu22.04
          command: ["/usr/bin/dcgmproftester12"]
          args: ["--no-dcgm-validation", "-t 1004", "-d 30"]
          resources:
            limits:
              nvidia.com/gpu: 1
          securityContext:
            capabilities:
              add: ["SYS_ADMIN"]
EOF
```

## Share GPU MPS

```
GPU_NODE_NAME=$(kubectl get nodes -l cloud.google.com/gke-nodepool=gpu-pool -o jsonpath={.items[0].metadata.name})
echo $GPU_NODE_NAME
```

```
kubectl label node $GPU_NODE_NAME nvidia.com/device-plugin.config=mps
```

```
kubectl get pods -n gpu-operator -l app=nvidia-device-plugin-mps-control-daemon
```

```
kubectl apply -f - << EOF
---
apiVersion: v1
kind: Pod
metadata:
  name: gpu-burn-1
  labels:
    app: gpu-burn
spec:
  containers:
  - name: gpu-burn
    image: quay.io/tariq_ibrahim/gpu-burn
    args: ["-m", "100%", "-tc", "60"]
    resources:
      limits:
        nvidia.com/gpu: 1
  restartPolicy: Never
---
apiVersion: v1
kind: Pod
metadata:
  name: gpu-burn-2
  labels:
    app: gpu-burn
spec:
  containers:
  - name: gpu-burn
    image: quay.io/tariq_ibrahim/gpu-burn
    args: ["-m", "100%", "-tc", "60"]
    resources:
      limits:
        nvidia.com/gpu: 1
  restartPolicy: Never
EOF
```