.PHONY: all argo

all: providers

providers:
	@kcl run vault/providers.k | tee manifests/crossplane-providers/vault-provider.yaml

argo:
	@kcl run argo/
