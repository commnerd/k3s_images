.PHONY: build push clean

build: clean
	docker build --network host -t aws-monitor-tmp:latest .
	docker tag aws-monitor-tmp commnerd/aws-monitor:$$(docker image inspect --format '{{ index .Config.Labels "image.version" }}' aws-monitor-tmp:latest)
	docker rmi aws-monitor-tmp:latest

push: build
	for IMAGE in $$(docker images --filter=reference='commnerd/aws-monitor:*' --format='{{.Tag}}'); do \
		docker push "commnerd/aws-monitor:$$IMAGE"; \
	done

clean:
	if [ "$$(docker images --filter='dangling=true' -q)" ]; then \
		docker rmi -f $$(docker images --filter='dangling=true' -q); \
	fi
	if [ "$$(docker images --filter=reference='commnerd/aws-monitor:*' --format='{{.Tag}}')" ]; then \
		echo "Cleaning up images: $$(docker images --filter=reference='commnerd/aws-monitor:*' --format='{{.Tag}}')"; \
		for TAG in $$(docker images --filter=reference='commnerd/aws-monitor:*' --format='{{.Tag}}'); do \
			docker rmi "commnerd/aws-monitor:$$TAG"; \
		done; \
	fi
