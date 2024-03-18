PROJECT_NAME = Microblog

.PHONY: setup init docker-build set-permissions config reset

setup:
	@echo "Setting up project directory..."
	mkdir $(PROJECT_NAME)
	cd $(PROJECT_NAME) && code .

init:
	@echo "Initializing git and cloning docker..."
	git init
	git clone https://github.com/XPERIA679/OJT1-Microblog $(PROJECT_NAME)

docker-build:
	@echo "Building docker containers..."
	docker compose up -d --build
	docker-compose exec php composer create-project laravel/laravel /var/www/html/

set-permissions:
	@echo "Setting permissions..."
	sudo chmod -R 777 src

config:
	@echo "Copying .env file..."
	cp OJT1-Microblog/src/.env $(PROJECT_NAME)

reset:
	@echo "Resetting docker containers..."
	@echo "Uncomment node in your Docker configuration now"
	docker compose down && docker compose up -d --build

all: setup init docker-build set-permissions config reset
	@echo "Project setup complete."
