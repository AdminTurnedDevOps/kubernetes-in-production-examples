const k8s = require('@kubernetes/client-node')

const kubeConfig = new k8s.KubeConfig()
kubeConfig.loadFromDefault()

const rbacV1Api = kubeConfig.makeApiClient(k8s.RbacAuthorizationV1Api)

function rbacCreate() {
    let rbacCreate = rbacV1Api.createClusterRole(
        rbacV1Api.V1ClusterRole = {
            apiVersion: 'rbac.authorization.k8s.io/v1',
            kind: 'ClusterRole',
            metadata: {
                name: 'reader',
            },
            rules: [
                {
                    apiGroups: [""],
                    resources: ['pods'],
                    verbs: ["watch", "get", "list"],
                },
            ],
        }
    );

    console.log(rbacCreate)
}

rbacCreate()