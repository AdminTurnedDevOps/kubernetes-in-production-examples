```
az ad user create --display-name traininguser --password 'Password12!@' --user-principal-name traininguser@yourdomain.onmicrosoft.com
```

```
az role definition list \
	--query "[?contains(roleName, 'Azure Kubernetes Service RBAC')].{roleName:roleName,description:description}"
```

```
az role assignment create \
    --assignee "traininguser@yourdomain.onmicrosoft.com" \
    --role "Azure Kubernetes Service RBAC Reader" \
    --scope $(az aks show \
        --resource-group yourrg \
        --name yourcluster \
        --query id -o tsv)
```