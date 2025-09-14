clang: clang-up

clang-up:
	docker compose -f docker/clang/docker-compose.yaml up -d

clang-down:
	docker compose -f docker/clang/docker-compose.yaml down --remove-orphans

clang-rebuild-image:
	docker compose -f docker/clang/docker-compose.yaml build --no-cache

clean: clang-down