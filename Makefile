.PHONY: all providers vault argo

all: providers vault

providers:
	kcl run vault/providers.k | tee manifests/crossplane-providers/vault-provider.yaml

vault:
	kcl run vault/policies.k | tee manifests/vault/policies.yaml

argo:
	@kcl run argo/
