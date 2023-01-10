SHELL := /bin/bash
.PHONY: default

default:
	@echo "Happy hacking!"

init: update-submodules
	test -f docker-compose.yaml || echo -en "version: '3.8'\n\nservices: {}" > docker-compose.yaml
	cp -n .env.example .env

start:
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml up -d

start-and-build: 
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml up -d --build

stop:
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml down --remove-orphans

prune:
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml down --remove-orphans -v

restart:
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml restart $(service)

pull: 
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml pull

logs:
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml logs -f $(service)

interactive:
	@[[ "$(service)" == @(gateway|naming-server|authorization-server|email-service|post-service|user-service|flight-service) ]] || exit 10
	@[[ "$(or $(target),dev)" == @(dev|release) ]] || exit 20
	yq -y -i '.services."$(service)".image = "cosmopk/habsat-$(service):dev"' docker-compose.yaml
	yq -y -i '.services."$(service)".build.context = "services/$(service)"' docker-compose.yaml
	yq -y -i '.services."$(service)".build.target = "$(or $(target),dev)"' docker-compose.yaml
	@[[ "$(or $(target),dev)" == @(dev) ]] && yq -y -i '.services."$(service)".volumes[0] = "./services/$(service):/app"' docker-compose.yaml || :
	@[[ "$(or $(target),dev)" == @(release) ]] && yq -y -i 'del(.services."$(service)".volumes)' docker-compose.yaml || :

standalone:
	@[[ "$(service)" == @(gateway|naming-server|authorization-server|email-service|post-service|user-service|flight-service) ]] || exit 10
	yq -y -i 'del(.services."$(service)".build)' docker-compose.yaml
	yq -y -i 'del(.services."$(service)".volumes)' docker-compose.yaml
	yq -y -i 'del(.services."$(service)".image)' docker-compose.yaml
	yq -y -i 'del(.services."$(service)" | select(length==0))' docker-compose.yaml

update-submodules:
	git submodule update --remote