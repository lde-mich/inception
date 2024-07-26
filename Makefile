
_USER=${USER}
_CUSTOM_DOMAIN=lde-mich.42.fr
_HOSTS_FILE=/etc/hosts

up:
	#se non esiste la cartella "wordpress" la crea
	if [ ! -d /home/${_USER}/data/wordpress ]; then \
		mkdir -p /home/${_USER}/data/wordpress ; \
	fi
	#se non esiste la cartella "mariadb" la crea
	if [ ! -d /home/${_USER}/data/mariadb ]; then \
		mkdir -p /home/${_USER}/data/mariadb ; \
	fi
	#se non esiste il dominio "lde-mich" all'interno del file "etc/hosts" lo crea
	if ! grep -q "$(_CUSTOM_DOMAIN)" $(_HOSTS_FILE); then \
		echo "127.0.0.1 $(_CUSTOM_DOMAIN)" | sudo tee -a $(_HOSTS_FILE); \
	else \
		echo "$(_CUSTOM_DOMAIN) esiste già in $(_HOSTS_FILE)"; \
	fi
	docker compose -f srcs/docker-compose.yml up --build
	


down:
	docker compose -f srcs/docker-compose.yml down -v --rmi all
	sudo rm -rf /home/${_USER}/data/mariadb
	sudo rm -rf /home/${_USER}/data/wordpress





rall: down
	docker system prune -a --force --volumes




reb: down up


.PHONY: up down rall reb


