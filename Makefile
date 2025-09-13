clang-build: clang-up clang-down

clang-up:
	docker compose -f docker/clang/docker-compose.yaml up -d --build

clang-down:
	docker compose -f docker/clang/docker-compose.yaml down --remove-orphans

clean: clang-down