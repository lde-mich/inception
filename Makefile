up:
	docker-compose -f srcs/docker-compose.yml up --build



down:
	docker-compose -f srcs/docker-compose.yml down -v --rmi all




rall:
	docker system prune -a --force --volumes




reb:
	docker-compose -f srcs/docker-compose.yml down -v --rmi all
	docker-compose -f srcs/docker-compose.yml up --build



.PHONY: up down rall reb 
