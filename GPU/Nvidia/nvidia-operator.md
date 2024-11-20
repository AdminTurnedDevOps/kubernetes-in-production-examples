```
helm repo add nvidia https://helm.ngc.nvidia.com/nvidia 
```

```
helm install gpuoperator --wait \
    -n gpu-operator --create-namespace \
    nvidia/gpu-operator
```