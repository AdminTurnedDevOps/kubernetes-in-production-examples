az aks nodepool add --resource-group devrelasaservice \
--cluster-name aksenvironment01 \
--name mywasipool \
--node-count 1 \
--workload-runtime WasmWasi