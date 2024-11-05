helm install --values values.yaml --namespace democratic-csi \
--create-namespace \
democratic-nfs-client democratic-csi/democratic-csi \
--kubeconfig ../../kubeadm