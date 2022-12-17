.PHONY: default

default:
	@echo "Happy hacking!"

init: pull-submodules
	find .configs -name '*.example.yml' | sed 'p;s/.example//g' | cat | paste - - --delimiters=" " | xargs -n 2 cp
	echo -en "version: '3.8'\n\n#services:" > docker-compose.yaml

start:
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml up -d

stop:
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml down --remove-orphans

restart: restart-gateway
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml up -d --build

prune:
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml down -v

restart-gateway:
	docker-compose restart gateway

pull-submodules:
	git submodule update --remote