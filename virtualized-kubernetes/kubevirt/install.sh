## To Add Specific Version
kubectl apply -f https://github.com/kubevirt/kubevirt/releases/download/v1.2.1/kubevirt-operator.yaml
kubectl apply -f https://github.com/kubevirt/kubevirt/releases/download/v1.2.1/kubevirt-cr.yaml


## To Add The Latest Version
export VERSION=$(curl -s https://api.github.com/repos/kubevirt/kubevirt/releases | grep tag_name | grep -v -- '-rc' | sort -r | head -1 | awk -F': ' '{print $2}' | sed 's/,//' | xargs)

kubectl apply -f https://github.com/kubevirt/kubevirt/releases/download/$VERSION/kubevirt-operator.yaml
kubectl apply -f https://github.com/kubevirt/kubevirt/releases/download/$VERSION/kubevirt-cr.yaml


## To Delete
kubectl delete -f https://github.com/kubevirt/kubevirt/releases/download/v1.2.0/kubevirt-operator.yaml
kubectl delete -f https://github.com/kubevirt/kubevirt/releases/download/v1.2.0/kubevirt-cr.yaml


## Delete All CRDs
MATCH_STRING="kubevirt"
kubectl get crds -oname | grep "$MATCH_STRING" | xargs kubectl delete