.PHONY: default

default:
	@echo "Happy hacking!"

init:
	find .configs -name '*.example.yml' | sed 'p;s/.example//g' | cat | paste - - --delimiters=" " | xargs -n 2 cp -n

start:
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml up -d

stop:
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml down

rebuild: restart-gateway
	docker-compose -f docker-compose.prod.yaml -f docker-compose.dev.yaml -f docker-compose.yaml up -d --build

restart-gateway:
	docker-compose restart gateway