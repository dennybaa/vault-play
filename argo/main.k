import manifests
import argo_cd.v1alpha1

app = v1alpha1.Application {
    metadata: {
        name: "vault-crossplane-provider"
        namespace: "argocd"
    }
    spec: {
        project: "default"
        destination: {
            name: "in-cluster"
            namespace: "crossplane-system"
        }
        source: {
            path: "manifests/vault/crossplane-provider.yaml"
            repoURL: "https://github.com/dennybaa/vault-play.git"
        }
        syncPolicy.automated: {}
    }
}

manifests.yaml_stream([app])
