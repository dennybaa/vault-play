import manifests
import argo_cd.v1alpha1

app = v1alpha1.Application {
    metadata: {
        name: "crossplane-providers"
        namespace: "argocd"
    }
    spec: {
        project: "default"
        destination: {
            name: "in-cluster"
            namespace: "crossplane-system"
        }
        source: {
            path: "manifests/crossplane-providers"
            repoURL: "https://github.com/dennybaa/vault-play.git"
        }
        syncPolicy.automated: {}
    }
}

manifests.yaml_stream([app])
