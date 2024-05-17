## Cluster scan with Kube-bench

1. Download kube-bench. The installation options will vary based on your operating system. For example, below is how you can download Kube-benhc on an Ubuntu server.
```
curl -L https://github.com/aquasecurity/kube-bench/releases/download/v0.6.10/kube-bench_0.6.10_linux_amd64.deb -o kube-bench_0.6.10_linux_amd64.deb
```

Then, you can run the installation.

```
sudo apt install ./kube-bench_0.6.10_linux_amd64.deb -f
```

ON MAC
```
curl -L https://github.com/aquasecurity/kube-bench/releases/download/v0.6.2/kube-bench_0.6.2_linux_amd64.tar.gz -o kube-bench_0.6.2_linux_amd64.tar.gz

tar -xvf kube-bench_0.6.2_linux_amd64.tar.gz
```

There are several other installation options. Please see them here: 

2. Once kube-bench is installed, run it on the terminal. 
```
kube-bench
```

It's going to run against your Kubernetes cluster that's in your current context, so you should see a ton of output on the terminal.