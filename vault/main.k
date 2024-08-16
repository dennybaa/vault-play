import manifests
import crossplane_provider_vault.v1beta1
import crossplane.v1 as cp

pv = cp.Provider {
    metadata: {
        name: "vault-provider"
        namespace: "crossplane-system"
    }
    spec.package: "xpkg.upbound.io/upbound/provider-vault:v1.0.0"
}

pvc = v1beta1.ProviderConfig {
    metadata: {
        name: "vault-provider-config"
        namespace: "crossplane-system"
    }
    spec: {
        address: "vault.vault-system"
        credentials: {
            source: "Secret"
            secretRef: {
                key: "token"
                name: "vault-provider-secret"
                namespace: "crossplane-system"
            }
        }
    }
}

manifests.yaml_stream([
    pv
    pvc
])
