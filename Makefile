.PHONY: init dev prod scan clean
init:
	chmod +x scripts/*.sh docker/*.sh
	./scripts/init-local.sh
dev:
	docker-compose -f docker-compose.yml -f docker-compose.override.yml up --build
prod:
	docker-compose -f docker-compose.yml -f docker-compose.prod.yml up --build -d
scan:
	docker build -t devrampart:scan -f docker/Dockerfile .
	docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image devrampart:scan
lint:
	docker run --rm -i hadolint/hadolint < docker/Dockerfile
clean:
	docker-compose down -v --remove-orphans
	docker system prune -f