DC=docker-compose
DATA_DIR = /home/chems/data
WP_DATA  = $(DATA_DIR)/wordpress
DB_DATA  = $(DATA_DIR)/mariadb

all : up

up :
	@echo "Building images and starting the containers"
	@cd srcs/ && $(DC) up -d --build
down :
	@echo "Shutting down server and containers"
	@cd srcs/ && $(DC) down

clean : down
	@echo "Light cleaning"
fclean : clean
	@echo "Deleting Wordpress and mariaDB volumes"
	@rm -rf $(WP_DATA)
	@rm -rf $(DB_DATA)

re : fclean all
	@echo "Restarting server and services..."

logs :
	@echo "Showing containers logs"
	@cd srcs/ && $(DC) logs

ps :
	@echo "Active containers :"
	@cd srcs/ && $(DC) ps

docker_reset :
	@echo "Deleting images and reseting the docker"
	@cd srcs/ && $(DC) down --rmi local --volumes

bonus:
	@echo "building bonus images and services"

.PHONY : all up down clean fclean re logs ps docker_reset bonus