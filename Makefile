.PHONY: all argo

all:
	@kcl run vault/ | tee manifests/vault/vault.yaml

argo:
	@kcl run argo/
