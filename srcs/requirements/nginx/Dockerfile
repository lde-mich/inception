FROM debian:11

# Imposta le variabili di ambiente per evitare interattività durante l'installazione
ENV DEBIAN_FRONTEND=noninteractive

# Aggiorna il sistema e installa Nginx
RUN apt-get update && apt-get install -y nginx openssl && apt-get clean \
	&& mkdir -p /etc/nginx/certs \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout \
	/etc/nginx/certs/server.key -out /etc/nginx/certs/server.crt -subj \
	"/C=IT/ST=Rome/L=Rome/O=42RomaLuis/OU=lde-mich/CN=lde-mich.42.fr"


COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/index.html /usr/share/nginx/html

# Comando per avviare Nginx in primo piano
CMD ["nginx", "-g", "daemon off;"]

