 Expose the CDI Upload Proxy. Containerized-Data-Importer (CDI) is a persistent storage management add-on for Kubernetes. It's primary goal is to provide a declarative way to build Virtual Machine Disks on PVCs for Kubevirt VMs

 ```
 kubectl port-forward -n cdi service/cdi-uploadproxy 18443:443
 ```
 
 Upload the ISO

 Azure Example
 ```
 ./virtctl-v1.2.2-darwin-amd64 image-upload \
   --image-path=/Users/michael/Downloads/ubuntu-24.04-live-server-amd64.iso \
   --pvc-name=ubuntuisohd \
   --size=10Gi \
   --storage-class=azurefile-premium \
   --uploadproxy-url=https://127.0.0.1:18443 \
   --insecure \
   --wait-secs=240
```

AWS Example
```
# You can find the SC creation under the `aws-eks` directory.
 ./virtctl-v1.2.2-darwin-amd64 image-upload \
   --image-path=/Users/michael/Downloads/ubuntu-24.04-live-server-amd64.iso \
   --pvc-name=ubuntuisohd \
   --size=10Gi \
   --storage-class=gp2immediate \
   --uploadproxy-url=https://127.0.0.1:18443 \
   --insecure \
   --wait-secs=240
```