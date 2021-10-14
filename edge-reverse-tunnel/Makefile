.PHONY: build push clean

build: clean
	docker build -t edge-reverse-tunnel-tmp:latest .
	docker tag edge-reverse-tunnel-tmp commnerd/edge-reverse-tunnel:$$(docker image inspect --format '{{ index .Config.Labels "image.version" }}' edge-reverse-tunnel-tmp:latest)
	docker rmi edge-reverse-tunnel-tmp:latest

push:
	for IMAGE in $$(docker images --filter=reference='commnerd/edge-reverse-tunnel:*' --format='{{.Tag}}'); do \
		docker push "commnerd/edge-reverse-tunnel:$$IMAGE"; \
	done

clean:
	if [ "$$(docker images --filter='dangling=true' -q)" ]; then \
		docker rmi -f $$(docker images --filter='dangling=true' -q); \
	fi
	if [ "$$(docker images --filter=reference='commnerd/edge-reverse-tunnel:*' --format='{{.Tag}}')" ]; then \
		echo "Cleaning up images: $$(docker images --filter=reference='commnerd/edge-reverse-tunnel:*' --format='{{.Tag}}')"; \
		for TAG in $$(docker images --filter=reference='commnerd/edge-reverse-tunnel:*' --format='{{.Tag}}'); do \
			docker rmi "commnerd/edge-reverse-tunnel:$$TAG"; \
		done; \
	fi
