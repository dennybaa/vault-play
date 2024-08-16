import manifests
import argo_cd.v1alpha1

app = v1alpha1.Application {
    metadata: {
        name: "vault-app"
        namespace: "argocd"
    }
    spec: {
        project: "default"
        destination.name: "in-cluster"
        source: {
            path: "manifests/vault"
            repoURL: "https://github.com/dennybaa/vault-play.git"
        }
        syncPolicy.automated: {}
    }
}

manifests.yaml_stream([app])
