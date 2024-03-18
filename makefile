.PHONY: clone build init-env set-permissions restart

clone:
	git clone https://github.com/XPERIA679/OJT1-Microblog

build:
	docker compose up -d --build

init-env:
	docker-compose exec php composer create-project laravel/laravel /var/www/html/

set-permissions:
	sudo chmod -R 777 src
	cp OJT1-Microblog/src/.env ./

restart:
	docker compose down && docker compose up -d --build

all: clone build init-env set-permissions restart
