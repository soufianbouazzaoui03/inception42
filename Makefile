COMPOSE_FILE=srcs/docker-compose.yml

all: up

up:
	@mkdir -p /home/soel-bou/data/wp_files
	@mkdir -p /home/soel-bou/data/wp_DB2

	@docker compose -f $(COMPOSE_FILE) up --build

down:
	@docker compose -f $(COMPOSE_FILE) down -v

restart: down up

fclean: down
	@docker image prune -a -f
	@docker volume prune -f
	@docker system prune -a -f

	@rm -rf /home/soel-bou/data/wp_files
	@rm -rf /home/soel-bou/data/wp_DB2
	@rm -rf /home/soel-bou/data

re: fclean up