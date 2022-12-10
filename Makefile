.PHONY: default

default:
	@echo "Happy hacking!"

init:
	echo "version: '3.8'" >> docker-compose.yaml

start:
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml up -d

stop:
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml down

rebuild: restart-gateway
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml up -d --build

restart-gateway:
	docker-compose restart gateway