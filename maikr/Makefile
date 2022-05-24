BUILDER_IMAGE := maikr-builder

.PHONY: build
build: tools-check clean-builder-image
	sudo docker run --privileged --rm tonistiigi/binfmt --install all
	docker buildx create --use --name $(BUILDER_IMAGE) node-amd64
	docker buildx create --append --name $(BUILDER_IMAGE) node-arm-v7
	docker buildx build  --platform linux/amd64,linux/arm/v7 .

.PHONY: tools-check
tools-check: sudo-check docker-buildx-check

.PHONY: sudo-check
sudo-check:
	@if [ ! "$$(which sudo)" ]; \
	then \
		echo "sudo not installed"; \
		exit 1; \
	fi

.PHONY: docker-check
docker-check:
	@if [ ! "$$(which docker)" ]; \
	then \
		echo "docker not installed"; \
		exit 1; \
	fi

.PHONY: docker-buildx-check
docker-buildx-check: docker-check
	@if [ ! "$$(which docker-buildx)" ]; \
	then \
		echo "docker buildx not installed"; \
		exit 1; \
	fi

.PHONY: clean-builder-image
clean-builder-image:
	@if [ "$$(docker buildx ls | grep $(BUILDER_IMAGE))" ]; \
	then \
		docker buildx use default; \
		docker buildx rm $(BUILDER_IMAGE); \
	fi
