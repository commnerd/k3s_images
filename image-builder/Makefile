.PHONY: build push clean

build: clean
	docker build -t image-builder-tmp:latest .
	docker tag image-builder-tmp commnerd/image-builder:$$(docker image inspect --format '{{ index .Config.Labels "image.version" }}' image-builder-tmp:latest)
	docker rmi image-builder-tmp:latest

push: build
	for IMAGE in $$(docker images --filter=reference='commnerd/image-builder:*' --format='{{.Tag}}'); do \
		docker push "commnerd/image-builder:$$IMAGE"; \
	done

clean:
	if [ "$$(docker images --filter='dangling=true' -q)" ]; then \
		docker rmi -f $$(docker images --filter='dangling=true' -q); \
	fi
	if [ "$$(docker images --filter=reference='commnerd/image-builder:*' --format='{{.Tag}}')" ]; then \
		echo "Cleaning up images: $$(docker images --filter=reference='commnerd/image-builder:*' --format='{{.Tag}}')"; \
		for TAG in $$(docker images --filter=reference='commnerd/image-builder:*' --format='{{.Tag}}'); do \
			docker rmi "commnerd/image-builder:$$TAG"; \
		done; \
	fi
