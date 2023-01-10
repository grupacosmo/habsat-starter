SHELL := /bin/bash
.PHONY: default

default:
	@echo "Happy hacking!"

init: pull-submodules
	test -f docker-compose.yaml || echo -en "version: '3.8'\n\nservices: {}" > docker-compose.yaml

start:
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml up -d

stop:
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml down --remove-orphans

restart: restart-gateway
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml up -d --build

prune:
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml down -v

interactive: 
	@[[ "$(service)" == @(gateway|naming-server|authorization-server|email-service|post-service|user-service|flight-service) ]] || exit 1
	@[[ "$${target:-dev}" == @(dev|release) ]] || exit 2
	yq -y -i '.services."$(service)".build.context = "services/$(service)"' docker-compose.yaml
	yq -y -i '.services."$(service)".build.target = "$(or $(target),dev)"' docker-compose.yaml

standalone:
	@[[ "$(service)" == @(gateway|naming-server|authorization-server|email-service|post-service|user-service|flight-service) ]] || exit 1
	yq -y -i 'del(.services."$(service)".build)' docker-compose.yaml
	yq -y -i 'del(.services."$(service)" | select(length==0))' docker-compose.yaml

restart-gateway:
	docker-compose restart gateway

pull-submodules:
	git submodule update --remote