
_USER=${USER}

up:
	#se non esiste la cartella "wordpress" la crea
	if [ ! -d /home/${_USER}/data/wordpress ]; then \
		mkdir -p /home/${_USER}/data/wordpress ; \
	fi
	#se non esiste la cartella "mariadb" la crea
	if [ ! -d /home/${_USER}/data/mariadb ]; then \
		mkdir -p /home/${_USER}/data/mariadb ; \
	fi
	docker-compose -f srcs/docker-compose.yml up --build


down:
	docker-compose -f srcs/docker-compose.yml down -v --rmi all




rall:
	docker system prune -a --force --volumes




reb: down up


.PHONY: up down rall reb


