1. https://github.com/kubevirt/containerized-data-importer/blob/main/README.md

```
export VERSION=$(curl -s https://api.github.com/repos/kubevirt/containerized-data-importer/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
kubectl create -f https://github.com/kubevirt/containerized-data-importer/releases/download/$VERSION/cdi-operator.yaml
kubectl create -f https://github.com/kubevirt/containerized-data-importer/releases/download/$VERSION/cdi-cr.yaml
```
2. Windows Server ISO or Linux ISO

3. `Virtctl`
```
export VERSION=$(curl https://storage.googleapis.com/kubevirt-prow/release/kubevirt/kubevirt/stable.txt)

wget https://github.com/kubevirt/kubevirt/releases/download/${VERSION}/virtctl-${VERSION}-darwin-amd64

## example
https://github.com/kubevirt/kubevirt/releases/download/v1.2.2/virtctl-v1.2.2-darwin-amd64
```