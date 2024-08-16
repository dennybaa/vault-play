import crossplane_provider_vault.vault.v1alpha1
import manifests

polcies = {
    test: """
    path "my-team/data/my/nodes/*"
    {
        capabilities = ["read"]
    }
    """
    a: "foo"
}
p = v1alpha1.Policy {
    metadata: {
        name: "test-policy"
        namespace: "crossplane-system"
    }
    spec: {
        providerConfigRef.name: "vault-provider-config"
        forProvider: {
            name: "test-policy"
            namespace: "vault-system"
            policy: polcies.test
        }
    }
}

manifests.yaml_stream([p])
