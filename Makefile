TOPTARGETS := builder clean
SUBDIRS := $(wildcard */.)
.PHONY: $(TOPTARGETS) $(SUBDIRS)


builder:
	docker buildx create --use --name k3s-builder node-amd64
	docker buildx create --append --name k3s-builder node-arm64
	docker buildx use k3s-builder
	docker buildx build --platform linux/amd64,linux/arm64 dhcpd


clean:
	docker buildx use default
	docker buildx rm k3s-builder


build: builder clean
